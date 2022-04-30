//
//  SignInViewController.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/02/22.
//

import UIKit
import SwiftUI

class SignInViewController: UIViewController {
    
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
        let signindata: Dictionary<String, Any>!
        let name: String = signInView.nameTextField.text!
        let email: String = signInView.emailTextField.text!
        let password: String = signInView.passwordTextField.text!
        signindata = [
            "name": name,
            "email": email,
            "password": password
        ]
        let checkName = Validator.shared.checkName(name: name, min: 1, max: 50)
        let mailCheckResult = Validator.shared.checkMail(mail: email)
        let passwordCheckResult = Validator.shared.checkPassword(password: password, min: 4, max: 6)
        //signInModel.postSignInData(signindata: signindata)
        //let view = UIHostingController(rootView: UserInfoView())
        //self.present(view, animated: true, completion: nil)
        
        
        //dialog.showDialog(vc: self, massegae: "テスト")
    }
    
}