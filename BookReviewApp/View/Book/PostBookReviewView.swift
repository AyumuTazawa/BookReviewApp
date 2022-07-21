//
//  PostBookReview.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/05/12.
//

import UIKit

class PostBookReviewView: UIView {

    //本のタイトル
    let bookTitleTextField: UITextField = { () -> UITextField in
        let textField = UITextField()
        textField.placeholder = "本のタイトルを入力してください"
        textField.borderStyle = .roundedRect
        return textField
    }()

    //URL
    let bookURLTextField: UITextField = { () -> UITextField in
        let textField = UITextField()
        textField.placeholder = "URLを入力してください"
        textField.borderStyle = .roundedRect
        return textField
    }()

    //紹介文
    let bookDetailTextField: UITextView = { () -> UITextView in
        let textView = UITextView()
        //textView.placeholder = "紹介文を入力してください"
        //textView.borderStyle = .roundedRect
        textView.backgroundColor = .gray
        return textView
    }()

    //レビュー
    let bookReviewTextField: UITextField = { () -> UITextField in
        let textField = UITextField()
        textField.placeholder = "レビューを入力してください"
        textField.borderStyle = .roundedRect
        return textField
    }()

    //登録ボタン
    var bookRegisterButton: UIButton! = { () -> UIButton in
        let button = UIButton()
        button.setTitle("登録", for: .normal)
        button.backgroundColor = UIColor.cyan
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }


    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }

    func setup() {
        self.addSubview(bookTitleTextField)
        self.addSubview(bookURLTextField)
        self.addSubview(bookDetailTextField)
        self.addSubview(bookReviewTextField)
        self.addSubview(bookRegisterButton)

        bookURLTextField.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(bookDetailTextField.snp.top).offset(-20)
        }

        bookTitleTextField.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(bookURLTextField.snp.top).offset(-20)
        }

        bookDetailTextField.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            //make.top.equalTo(bookDetailItemLabel.snp.bottom).offset(20)
        }

        bookReviewTextField.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(bookDetailTextField.snp.bottom).offset(20)
        }

        bookRegisterButton.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.6)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(bookReviewTextField.snp.bottom).offset(80)
        }
    }

}
