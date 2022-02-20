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
        
        self.topView = TopView()
        self.topView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        self.view.addSubview(topView)

        topView.toLogInButton.addTarget(self, action: #selector(didTapButton), for: .touchDown)
    }
    
    @objc func didTapButton(_ sender: UIButton) {

        let secondPageViewController = LoginViewController()
         navigationController?.pushViewController(secondPageViewController, animated: true)

    }
        

}