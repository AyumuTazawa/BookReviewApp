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
        self.topView = TopView()
        self.topView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        self.view.addSubview(topView)
    }
    
    func setUpButton() {
        topView.toLogInButton.addTarget(self,
                                        action: #selector(didTapButton),
                                        for: .touchDown)
        topView.toSignInButton.addTarget(self,
                                         action: #selector(didTaptoSignInButton),
                                         for: .touchDown)
    }
    
    
    @objc func didTapButton(_ sender: UIButton) {
//        let vc = LoginViewController()
//        navigationController?.pushViewController(vc, animated: true)
        self.loadingCircle.showIndicator()
        let vc = LoginViewController()
        let loginViewController = UINavigationController.init(rootViewController: vc)
        loginViewController.modalTransitionStyle = .coverVertical
        //signInViewController.modalPresentationStyle = .custom
        self.loadingCircle.stopIndicator()
        self.present(loginViewController, animated: true, completion: nil)
    }
    
    @objc func didTaptoSignInButton(_ sender: UIButton) {
//        let signInViewController = SignInViewController()
//        navigationController?.pushViewController(signInViewController, animated: true)
        
        
        let vc = SignInViewController()
        let signInViewController = UINavigationController.init(rootViewController: vc)
        signInViewController.modalTransitionStyle = .coverVertical
        //signInViewController.modalPresentationStyle = .custom
        self.present(signInViewController, animated: true, completion: nil)
    }

}
