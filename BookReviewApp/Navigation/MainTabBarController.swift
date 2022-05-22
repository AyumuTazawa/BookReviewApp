//
//  MainTabBarController.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/05/22.
//

import Foundation
import UIKit

final class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTab()
    }
    
    func setupTab() {
        let postBookReviewViewController = PostBookReviewViewController()
        postBookReviewViewController.tabBarItem = UITabBarItem(title: "tab1", image: .none, tag: 0)
        
        let bookReviewListViewController = BookReviewListViewController()
        bookReviewListViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        
        viewControllers = [bookReviewListViewController, postBookReviewViewController]
    }
}
