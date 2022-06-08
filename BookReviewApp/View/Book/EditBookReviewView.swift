//
//  BookReviewEditView.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/05/14.
//

import UIKit

class EditBookReviewView: UIView {
    
    //項目名:本のタイトル
    var bookTitleItemLabel: UILabel = { () -> UILabel in
        let label: UILabel = UILabel()
        //label.backgroundColor = .gray
        label.text = "タイトル："
        return label
    }()
    //本のタイトル
    let bookTitleTextField: UITextField = { () -> UITextField in
        let textField = UITextField()
        textField.placeholder = "本のタイトルを入力してください"
        textField.borderStyle = .roundedRect
        //textField.backgroundColor = .red
        return textField
    }()
    
    //項目名:URL
    var bookURLItemLabel: UILabel = { () -> UILabel in
        let label: UILabel = UILabel()
        label.text = "URL："
        //label.backgroundColor = .systemPink
        return label
    }()
    
    //URL
    let bookURLTextField: UITextField = { () -> UITextField in
        let textField = UITextField()
        textField.placeholder = "URLを入力してください"
        textField.borderStyle = .roundedRect
        //textField.backgroundColor = .blue
        return textField
    }()
    
    //項目名:紹介文
    var bookDetailItemLabel: UILabel = { () -> UILabel in
        let label: UILabel = UILabel()
        label.text = "紹介文："
        //label.backgroundColor = .brown
        return label
    }()
    
    //紹介文
    let bookDetailTextView: UITextView = { () -> UITextView in
        let teextView = UITextView()
        teextView.backgroundColor = .gray
//        teextView.placeholder = "紹介文を入力してください"
//        teextView.borderStyle = .roundedRect
        return teextView
    }()
    
    //項目名:レビュー
    var bookReviewItemLabel: UILabel = { () -> UILabel in
        let label: UILabel = UILabel()
        label.text = "レビュー："
        //label.backgroundColor = .darkGray
        return label
    }()
    
    //レビュー
    let bookReviewTextView: UITextView = { () -> UITextView in
        let textView = UITextView()
        textView.backgroundColor = .gray
        return textView
    }()
    
    //削除ボタン
    var bookDeleteButton: UIButton! = { () -> UIButton in
        let button = UIButton()
        button.setTitle("削除", for: .normal)
        button.backgroundColor = UIColor.systemPink
        button.setTitleColor(.systemBlue, for: .normal)
        //button.backgroundColor = .green
        return button
    }()
    
    //更新ボタン
    var bookUpdateButton: UIButton! = { () -> UIButton in
        let button = UIButton()
        button.setTitle("更新", for: .normal)
        button.backgroundColor = UIColor.systemPink
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    let spaceAdjustmentLabel: UILabel = { () -> UILabel in
        let label = UILabel()
        //label.backgroundColor = .red
        return label
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
        self.addSubview(bookDetailTextView)
        self.addSubview(bookTitleItemLabel)
        self.addSubview(bookTitleTextField)
        self.addSubview(bookURLItemLabel)
        self.addSubview(bookURLTextField)
        self.addSubview(bookDetailItemLabel)
        self.addSubview(bookReviewItemLabel)
        self.addSubview(bookReviewTextView)
        self.addSubview(spaceAdjustmentLabel)
        self.addSubview(bookDeleteButton)
        self.addSubview(bookUpdateButton)
        
        
        bookURLTextField.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(bookDetailItemLabel.snp.top).offset(-10)
        }
        
        bookURLItemLabel.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(20)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(bookURLTextField.snp.top).offset(-5)
        }
        
        bookTitleTextField.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(bookURLItemLabel.snp.top).offset(-10)
        }
        
        bookTitleItemLabel.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(20)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(bookTitleTextField.snp.top).offset(-5)
        }
        
        bookDetailItemLabel.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(20)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(bookDetailTextView.snp.top).offset(-5)
            //make.centerY.equalToSuperview()
        }
        
        bookDetailTextView.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(100)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            //make.top.equalTo(bookDetailItemLabel.snp.bottom).offset(5)
        }
        
        bookReviewItemLabel.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(20)
            make.centerX.equalToSuperview()
            make.top.equalTo(bookDetailTextView.snp.bottom).offset(10)
        }
        
        bookReviewTextView.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(100)
            make.centerX.equalToSuperview()
            make.top.equalTo(bookReviewItemLabel.snp.bottom).offset(5)
        }
        
        spaceAdjustmentLabel.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.02)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(bookReviewTextView.snp.bottom).offset(40)
        }
        
        bookUpdateButton.snp.makeConstraints { make in
            //make.size.equalTo(100)
            make.width.equalToSuperview().multipliedBy(0.39)
            make.height.equalTo(50)
            make.top.equalTo(spaceAdjustmentLabel)
            make.left.equalTo(spaceAdjustmentLabel.snp.right).offset(0)
        }
        
        bookDeleteButton.snp.makeConstraints { make in
            //make.size.equalTo(100)
            make.width.equalToSuperview().multipliedBy(0.39)
            make.height.equalTo(50)
            make.top.equalTo(spaceAdjustmentLabel)
            make.right.equalTo(spaceAdjustmentLabel.snp.left).offset(0)
        }
    }
    
}
