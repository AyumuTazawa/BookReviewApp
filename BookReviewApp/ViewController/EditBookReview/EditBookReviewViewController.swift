//
//  BookReviewEditViewController.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/05/14.
//

import UIKit

class EditBookReviewViewController: UIViewController {

    var postBookReview = EditBookReviewView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setUpView()
    }
    
    func setUpView() {
        let width = self.view.bounds.width
        let height = self.view.bounds.height
        postBookReview.frame = CGRect(x: 0, y: 0, width: width, height: height)
        self.view.addSubview(postBookReview)
    }
}