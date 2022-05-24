//
//  LoginViewController.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/01/08.
//

import UIKit

class LoginViewController: UIViewController {
    var loginView: Login! = Login()
    var loginModel: LoginModel = LoginModel()
    var errMessage: [String] = []
    var logIndata: Dictionary<String, String> = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setUpView()
        setUpButton()
        
    }
    
    func setUpView() {
        let width = self.view.bounds.width
        let height = self.view.bounds.height
        self.loginView = Login()
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
        self.logIndata["email"] = loginView.emailTextField.text!
        self.logIndata["password"] = loginView.passwordTextField.text!
        let checkValidationResult: Bool = executeValidationChek(data: logIndata)
        if(checkValidationResult){
            self.loginModel.logIn(logIndata: logIndata) { completion in
                let token = completion?.token
                self.saveToken(token: token!)
                let vc = MainTabBarController()
                vc.modalTransitionStyle = .crossDissolve
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            }
        }
        
    }
    
    func saveToken(token: String) -> Bool {
        let id = "id"
        let key = "userToken"
        guard let data = token.data(using: .utf8) else {
            return false
        }
        
        let query: [String: Any] = [
            kSecClass              as String: kSecClassGenericPassword,
            kSecAttrService        as String: key,
            kSecAttrAccount        as String: id,
            kSecValueData          as String: data,
        ]
        let status = SecItemCopyMatching(query as CFDictionary, nil)
        
        var itemUpdateStatus: OSStatus?
        
        print(status)
        
        switch status {
        case errSecItemNotFound:
            itemUpdateStatus = SecItemAdd(query as CFDictionary, nil)
            
        case errSecSuccess:
            itemUpdateStatus = SecItemUpdate(query as CFDictionary, [kSecValueData as String: data] as CFDictionary)
            
        default:
            print("該当なし")
        }
        
        if itemUpdateStatus == errSecSuccess {
            print("キーチェーンにトークン保存完了")
        } else {
            return false
        }
        return true
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
