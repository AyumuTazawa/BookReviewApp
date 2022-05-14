//
//  PostBookReview.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/05/12.
//

import UIKit

class PostBookReview: UIView {

    //項目名:本のタイトル
    var bookTitleLabel: UILabel = { () -> UILabel in
        let label: UILabel = UILabel()
        label.text = "タイトル"
        return label
    }()
    //本のタイトル
    let bookTitleTextField: UITextField = { () -> UITextField in
        let textField = UITextField()
        textField.placeholder = "本のタイトルを入力してください"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    //項目名:URL
    var bookURLLabel: UILabel = { () -> UILabel in
        let label: UILabel = UILabel()
        label.text = "URL"
        return label
    }()
    
    //URL
    let URLTextField: UITextField = { () -> UITextField in
        let textField = UITextField()
        textField.placeholder = "URLを入力してください"
        textField.borderStyle = .roundedRect
        return textField
    }()

    //項目名:紹介文
    var bookDetailLabel: UILabel = { () -> UILabel in
        let label: UILabel = UILabel()
        label.text = "紹介文"
        return label
    }()
    
    //紹介文
    let detailTextField: UITextField = { () -> UITextField in
        let textField = UITextField()
        textField.placeholder = "紹介文を入力してください"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    //項目名:レビュー
    var bookReviewLabel: UILabel = { () -> UILabel in
        let label: UILabel = UILabel()
        label.text = "レビュー"
        return label
    }()
    
    //レビュー
    let reviewTextField: UITextField = { () -> UITextField in
        let textField = UITextField()
        textField.placeholder = "レビューを入力してください"
        textField.borderStyle = .roundedRect
        return textField
    }()

}
