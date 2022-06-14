//
//  SignInViewController.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/02/22.
//

import UIKit
import SwiftUI

class SignInViewController: UIViewController {
    
    var errMessage: [String] = []
    var signInView:SignInView = SignInView()
    var userApiClient: UserApiClient = UserApiClient()
    var saveUserToken: SaveUserToken = SaveUserToken()
    var dialog: Dialog = Dialog()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setUpView()
        setUpButton()
   
        //画面遷移
//        let vc = MainTabBarController()
//        vc.modalTransitionStyle = .crossDissolve
//        vc.modalPresentationStyle = .fullScreen
//        self.present(vc, animated: true, completion: nil)
        
    }
    
    func setUpView() {
        let width = self.view.bounds.width
        let height = self.view.bounds.height
        signInView.frame = CGRect(x: 0, y: 0, width: width, height: height)
        self.view.addSubview(signInView)
    }
    
    func setUpButton() {
        signInView.signInButton.addTarget(self,
                                          action: #selector(didTapSignInButton),
                                          for: .touchDown)
    }
    
    @objc func didTapSignInButton() {
        let name = UserName(name: signInView.nameTextField.text!)
        let email = Email(email: signInView.emailTextField.text!)
        let password = Password(password: signInView.passwordTextField.text!)
        let signIn = SignIn(name: name, email: email, password: password)
        
        let checkValidationResult: String = executeValidationChek(data: signIn.makePostData())
        if(checkValidationResult == "バリデーションチェック成功") {
            userApiClient.postSignInData(signindata: signIn) { completion in
                print(completion)
                let token = completion?.token
                self.saveUserToken.saveToken(token: token!)
            }
        }
    }
    
    func executeValidationChek(data: Dictionary<String, String>) -> String {
        self.errMessage.removeAll()
        let checkNameResult = Validator.shared.checkName(name: data["name"], min: 1, max: 50)
        if(checkNameResult.isValid == false){ errMessage.append(checkNameResult.isError) }
        
        let mailCheckResult = Validator.shared.checkMail(mail: data["email"])
        if(mailCheckResult.isValid == false){ errMessage.append(mailCheckResult.isError) }
        
        let passwordCheckResult = Validator.shared.checkPassword(password: data["password"], min: 4, max: 20)
        if(passwordCheckResult.isValid == false){ errMessage.append(passwordCheckResult.isError) }
        
        if (errMessage.isEmpty){
            //signInModel.postSignInData(signindata: signindata)
            //dialog.showDialog(vc: self, massegae: "テスト")
            //self.signInModel.postSignInData(signindata: data)
            return "バリデーションチェック成功"
        }else{
            print(errMessage)
            return "バリデーションチェック成功"
        }
    }
    
}
