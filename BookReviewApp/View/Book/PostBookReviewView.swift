//
//  PostBookReview.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/05/12.
//

import UIKit

class PostBookReviewView: UIView {

    private lazy var scrollView: UIScrollView = {
      let scrollView = UIScrollView()
      scrollView.backgroundColor = .red
      scrollView.translatesAutoresizingMaskIntoConstraints = false
      return scrollView
    }()

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
        self.addSubview(scrollView)
        scrollView.addSubview(bookTitleTextField)
        scrollView.addSubview(bookURLTextField)
        scrollView.addSubview(bookDetailTextField)
        scrollView.addSubview(bookReviewTextField)
        scrollView.addSubview(bookRegisterButton)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(self).inset(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        }

        bookURLTextField.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.95)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(bookDetailTextField.snp.top).offset(-20)
        }

        bookTitleTextField.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.95)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(bookURLTextField.snp.top).offset(-20)
        }

        bookDetailTextField.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.95)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            //make.top.equalTo(bookDetailItemLabel.snp.bottom).offset(20)
        }

        bookReviewTextField.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.95)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(bookDetailTextField.snp.bottom).offset(20)
        }

        bookRegisterButton.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.95)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(bookReviewTextField.snp.bottom).offset(80)
        }
    }

}
