//
//  TopViewController.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/02/03.
//

import UIKit

class TopViewController: UIViewController {
    var topView: TopView!
    let loadingCircle: LoadingCircle = LoadingCircle()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.title = "Top画面"
        setUpView()
        setUpButton()

    }
    
    
    func setUpView() {
        let width = self.view.bounds.width
        let height = self.view.bounds.height
        self.topView = TopView()
        self.topView.frame = CGRect(x: 0, y: 0, width: width, height: height)
        self.view.addSubview(topView)
    }
    
    func setUpButton() {
        topView.toLogInButton.addTarget(self,
                                        action: #selector(didTapToLoginButton),
                                        for: .touchDown)
        topView.toSignInButton.addTarget(self,
                                         action: #selector(didTapToSignInButton),
                                         for: .touchDown)
    }
    
    
    @objc func didTapToLoginButton(_ sender: UIButton) {

        self.toLoginViewController()
    }
    
    @objc func didTapToSignInButton(_ sender: UIButton) {

        self.toSignInViewController()
    }
    
    func toLoginViewController() {
        let vc = LoginViewController()
        let loginViewController = UINavigationController.init(rootViewController: vc)
        loginViewController.modalTransitionStyle = .coverVertical
        self.present(loginViewController, animated: true, completion: nil)
    }
    
    func toSignInViewController() {
        let vc = SignInViewController()
        let signInViewController = UINavigationController.init(rootViewController: vc)
        signInViewController.modalTransitionStyle = .coverVertical
        self.present(signInViewController, animated: true, completion: nil)
    }

}
