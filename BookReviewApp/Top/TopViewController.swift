//
//  TopViewController.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/02/03.
//

import UIKit

class TopViewController: UIViewController {
    var topView: TopView!

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
        let vc = LoginViewController()
         navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func didTaptoSignInButton(_ sender: UIButton) {
        let signInViewController = SignInViewController()
        navigationController?.pushViewController(signInViewController, animated: true)
    }

}
