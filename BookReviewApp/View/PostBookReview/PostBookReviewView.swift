//
//  PostBookReview.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/05/12.
//

import UIKit

class PostBookReviewView: UIView {

    //項目名:本のタイトル
    var bookTitleItemLabel: UILabel = { () -> UILabel in
        let label: UILabel = UILabel()
        label.text = "タイトル："
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
    var bookURLItemLabel: UILabel = { () -> UILabel in
        let label: UILabel = UILabel()
        label.text = "URL："
        return label
    }()
    
    //URL
    let bookURLTextField: UITextField = { () -> UITextField in
        let textField = UITextField()
        textField.placeholder = "URLを入力してください"
        textField.borderStyle = .roundedRect
        return textField
    }()

    //項目名:紹介文
    var bookDetailItemLabel: UILabel = { () -> UILabel in
        let label: UILabel = UILabel()
        label.text = "紹介文："
        return label
    }()
    
    //紹介文
    let bookDetailTextField: UITextView = { () -> UITextView in
        let textView = UITextView()
        //textView.placeholder = "紹介文を入力してください"
        //textView.borderStyle = .roundedRect
        textView.backgroundColor = .gray
        return textView
    }()
    
    //項目名:レビュー
    var bookReviewItemLabel: UILabel = { () -> UILabel in
        let label: UILabel = UILabel()
        label.text = "レビュー："
        return label
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
        self.addSubview(bookDetailItemLabel)
        self.addSubview(bookTitleItemLabel)
        self.addSubview(bookTitleTextField)
        self.addSubview(bookURLItemLabel)
        self.addSubview(bookURLTextField)
        self.addSubview(bookDetailTextField)
        self.addSubview(bookReviewItemLabel)
        self.addSubview(bookReviewTextField)
        self.addSubview(bookRegisterButton)
        
        bookDetailItemLabel.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(30)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        bookURLTextField.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(bookDetailItemLabel.snp.top).offset(-20)
        }
        
        bookURLItemLabel.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(bookURLTextField.snp.top).offset(-20)
        }
        
        bookTitleTextField.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(bookURLItemLabel.snp.top).offset(-20)
        }
        
        bookTitleItemLabel.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(bookTitleTextField.snp.top).offset(-20)
        }
        
        bookDetailTextField.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(bookDetailItemLabel.snp.bottom).offset(20)
        }
        
        bookReviewItemLabel.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(bookDetailTextField.snp.bottom).offset(20)
        }
        
        bookReviewTextField.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(bookReviewItemLabel.snp.bottom).offset(20)
        }
        
        bookRegisterButton.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.6)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(bookReviewTextField.snp.bottom).offset(80)
        }
    }

}
