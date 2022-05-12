//
//  PostBookReview.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/05/12.
//

import UIKit

class PostBookReview: UIView {

    //本のタイトル
    var signInButton: UITextField! = { () -> UITextField in
        let textField = UITextField()
        textField.placeholder = "本のタイトルを入力してください"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    //URL
    let URLTextField: UITextField = { () -> UITextField in
        let textField = UITextField()
        textField.placeholder = "URLを入力してください"
        textField.borderStyle = .roundedRect
        return textField
    }()

    //紹介文
    let detailTextField: UITextField = { () -> UITextField in
        let textField = UITextField()
        textField.placeholder = "紹介文を入力してください"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    //レビュー
    let reviewTextField: UITextField = { () -> UITextField in
        let textField = UITextField()
        textField.placeholder = "レビューを入力してください"
        textField.borderStyle = .roundedRect
        return textField
    }()

}
