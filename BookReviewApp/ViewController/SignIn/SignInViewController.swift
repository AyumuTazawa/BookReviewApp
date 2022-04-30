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
        var signindata: Dictionary<String, Any> = ["1":"テスト"]
        var name = signInView.nameTextField.text
        var email = signInView.emailTextField.text
        var password = signInView.passwordTextField.text
        signindata = [
            "name": name,
            "email": email,
            "password": password
        ]
        signInModel.postSignInData(signindata: signindata)
        let view = UIHostingController(rootView: UserInfoView())
        self.present(view, animated: true, completion: nil)
        //dialog.showDialog(vc: self, massegae: "テスト")
    }
    
}
