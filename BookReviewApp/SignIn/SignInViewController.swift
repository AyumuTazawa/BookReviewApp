//
//  SignInViewController.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/02/22.
//

import UIKit

class SignInViewController: UIViewController {
    var signInView:SignInView! = SignInView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        signInView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        self.view.addSubview(signInView)
        
        signInView.signInButton.addTarget(self, action: #selector(didTapsignInButton), for: .touchDown)
    }
    
    @objc func didTapsignInButton() {
        let vc = ViewController.init()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
