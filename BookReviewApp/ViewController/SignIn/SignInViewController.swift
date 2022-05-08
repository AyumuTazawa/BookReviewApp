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
    var signindata: Dictionary<String, String> = [:]
    var signInView:SignInView = SignInView()
    var signInModel: SignInModel = SignInModel()
    var dialog: Dialog = Dialog()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setUpView()
        setUpButton()
        
    }
    
    func setUpView() {
        let width = self.view.bounds.width
        let height = self.view.bounds.height
        signInView.frame = CGRect(x: 0, y: 0, width: width, height: height)
        self.view.addSubview(signInView)
    }
    
    func setUpButton() {
        signInView.signInButton.addTarget(self,
                                          action: #selector(didTapsignInButton),
                                          for: .touchDown)
    }
    
    @objc func didTapsignInButton() {
        let name: String = signInView.nameTextField.text!
        let email: String = signInView.emailTextField.text!
        let password: String = signInView.passwordTextField.text!
        self.signindata = [
            "name": name,
            "email": email,
            "password": password
        ]
        executeValidationChek(data: signindata)
    }
    
    func executeValidationChek(data: Dictionary<String, String>) -> Void {
        self.errMessage.removeAll()
        let checkNameResult = Validator.shared.checkName(name: data["name"], min: 1, max: 50)
        if(checkNameResult.isValid == false){ errMessage.append(checkNameResult.isError) }
        
        let mailCheckResult = Validator.shared.checkMail(mail: data["email"])
        if(mailCheckResult.isValid == false){ errMessage.append(mailCheckResult.isError) }
        
        let passwordCheckResult = Validator.shared.checkPassword(password: data["password"], min: 4, max: 6)
        if(passwordCheckResult.isValid == false){ errMessage.append(passwordCheckResult.isError) }
        
        if (errMessage.isEmpty){
            //signInModel.postSignInData(signindata: signindata)
            let view = UIHostingController(rootView: UserInfoView())
            self.present(view, animated: true, completion: nil)
            //dialog.showDialog(vc: self, massegae: "テスト")
        }else{
            print(errMessage)
        }
    }
    
}
