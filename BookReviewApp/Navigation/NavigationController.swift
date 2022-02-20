//
//  NavigationController.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/02/20.
//

import UIKit

class NavigationController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        toNxtPage()
    }
    
    func toNxtPage() {
        let vc = TopViewController()
        let customNavigationViewController = UINavigationController.init(rootViewController: vc)
        customNavigationViewController.modalTransitionStyle = .crossDissolve
        customNavigationViewController.modalPresentationStyle = .fullScreen
        self.present(customNavigationViewController, animated: true, completion: nil)
    }
    
}
