//
//  LoginViewController.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/01/08.
//

import UIKit

class LoginViewController: UIViewController {
    var loginView: LoginView! = LoginView()
    var userApiClient: UserApiClient = UserApiClient()
    var saveUserToken: SaveUserToken = SaveUserToken()
    var errMessage: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setUpView()
        setUpButton()
        
    }
    
    func setUpView() {
        let width = self.view.bounds.width
        let height = self.view.bounds.height
        self.loginView = LoginView()
        loginView.frame = CGRect(x: 0, y: 0, width: width, height: height)
        self.view.addSubview(loginView)
    }
    
    func setUpButton() {
        loginView.logInButton.addTarget(self,
                                        action: #selector(didTapButton),
                                        for: .touchDown)
    }
    
    @objc func didTapButton() {
        print("ボタンがタップされました")
        let email: Email = Email(email: loginView.emailTextField.text!)
        let password: Password = Password(password: loginView.passwordTextField.text!)
        let login: Login = Login(email: email, password: password)


        let checkValidationResult: Bool = executeValidationChek(data: login.postData())
        if(checkValidationResult){
            self.executeLogin(logIndata: login)
            
        }
    }
    
    func executeLogin(logIndata: Login) {
        self.userApiClient.logIn(logIndata: logIndata) { completion in
            let token = completion?.token
            self.saveUserToken.saveToken(token: token!)
            self.toMainTabBar()
        }
    }
    
    func toMainTabBar() {
        let vc = MainTabBarController()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    func executeValidationChek(data: Dictionary<String, String>) -> Bool {
        self.errMessage.removeAll()
        let mailCheckResult = Validator.shared.checkMail(mail: data["email"])
        if(mailCheckResult.isValid == false){ errMessage.append(mailCheckResult.isError) }
        
        let passwordCheckResult = Validator.shared.checkPassword(password: data["password"], min: 4, max: 20)
        if(passwordCheckResult.isValid == false){ errMessage.append(passwordCheckResult.isError) }
        
        if (errMessage.isEmpty){
            //signInModel.postSignInData(signindata: signindata)
            //dialog.showDialog(vc: self, massegae: "テスト")
            //self.signInModel.postSignInData(signindata: data)
            print("バリデーションチェック成功")
            return true
        }else{
            print(errMessage)
            print("バリデーションチェック失敗")
            return false
        }
    }
    
    
}
