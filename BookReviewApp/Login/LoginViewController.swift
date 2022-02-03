//
//  LoginViewController.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/01/08.
//

import UIKit

class LoginViewController: UIViewController {
    var loginView:Login! = Login()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.loginView = Login()
        loginView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)

        // Do any additional setup after loading the view.
//        view.backgroundColor = .brown
        self.view.addSubview(loginView)
        loginView.logInButton.addTarget(self, action: #selector(didTapButton), for: .touchDown)
        
    }
    
    @objc func didTapButton() {
        print("ボタンがタップされました")
    }


}
