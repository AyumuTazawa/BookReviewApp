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
        let postBookReview = PostBookReviewViewController()
        postBookReview.tabBarItem = UITabBarItem(title: "tab1", image: .none, tag: 0)
        
        //let bookReviewListViewController = DetailBookNavigationController()
        let vc = BookReviewListViewController()
        let bookList = UINavigationController.init(rootViewController: vc)
        bookList.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        
        viewControllers = [bookList, postBookReview]
    }
}
