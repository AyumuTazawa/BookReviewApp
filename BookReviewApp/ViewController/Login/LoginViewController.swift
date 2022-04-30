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
        let secondPageViewController = ViewController.init()
        navigationController?.pushViewController(secondPageViewController, animated: true)
    }


}
