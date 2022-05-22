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


import UIKit

final class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTab()
    }

    func setupTab() {
        let topViewController = TopViewController()
        topViewController.tabBarItem = UITabBarItem(title: "tab1", image: .none, tag: 0)

        let bookReviewListViewController = BookReviewListViewController()
        bookReviewListViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)

        viewControllers = [topViewController, bookReviewListViewController]
    }

}
