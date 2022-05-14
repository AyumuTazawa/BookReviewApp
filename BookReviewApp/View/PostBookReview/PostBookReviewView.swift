//
//  PostBookReview.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/05/12.
//

import UIKit

class PostBookReviewView: UIView {

    //項目名:本のタイトル
    var bookTitleLabel: UILabel = { () -> UILabel in
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
    var bookURLLabel: UILabel = { () -> UILabel in
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
    var bookDetailLabel: UILabel = { () -> UILabel in
        let label: UILabel = UILabel()
        label.text = "紹介文："
        return label
    }()
    
    //紹介文
    let bookDetailTextField: UITextField = { () -> UITextField in
        let textField = UITextField()
        textField.placeholder = "紹介文を入力してください"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    //項目名:レビュー
    var bookReviewLabel: UILabel = { () -> UILabel in
        let label: UILabel = UILabel()
        label.text = "レビュー："
        return label
    }()
    
    //レビュー
    let bookreviewTextField: UITextField = { () -> UITextField in
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
        self.addSubview(bookDetailLabel)
        self.addSubview(bookTitleLabel)
        self.addSubview(bookTitleTextField)
        self.addSubview(bookURLLabel)
        self.addSubview(bookURLTextField)
        self.addSubview(bookDetailTextField)
        self.addSubview(bookDetailTextField)
        self.addSubview(bookRegisterButton)
        
        bookDetailLabel.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(30)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        bookURLTextField.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(bookDetailLabel.snp.top).offset(-20)
        }
        
        bookURLLabel.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(bookURLTextField.snp.top).offset(-20)
        }
        
        bookTitleTextField.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(bookURLLabel.snp.top).offset(-20)
        }
        
        bookTitleLabel.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(bookTitleTextField.snp.top).offset(-20)
        }
        
        bookDetailTextField.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(bookDetailLabel.snp.bottom).offset(20)
        }
        
        bookRegisterButton.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(bookDetailTextField.snp.bottom).offset(80)
        }
    }

}
