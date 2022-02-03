//
//  Login.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/01/13.
//

import UIKit
import SnapKit

class Login: UIView {
    
    public var logInButton: UIButton! = {
        let button = UIButton()
        button.setTitle("ログイン", for: .normal)
        button.backgroundColor = UIColor.cyan
        button.setTitleColor(.systemBlue, for: .normal)
        
        return button
    }()
    
    let emailTextField: UITextField = {
        let mailTextField = UITextField()
        mailTextField.placeholder = "メールアドレスを入力してください"
        mailTextField.borderStyle = .roundedRect
        return mailTextField
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
        self.addSubview(logInButton)
        self.addSubview(emailTextField)

        logInButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(logInButton.snp.top).offset(-50)
        }
    }
    //メール入力テキストフィールド
//    func setEmailTextField() {
//
//
//        let emailTextFieldSize: CGRect = CGRect(x: 20, y: 400,width: 300,height: 60)
//        let mailTextField = UITextField(frame: emailTextFieldSize)
//        mailTextField.placeholder = "メールアドレスを入力してください"
//        mailTextField.borderStyle = .roundedRect
//
//        self.addSubview(mailTextField)
//        mailTextField.snp.makeConstraints { make in
//            make.width.equalTo(200)
//            make.height.equalTo(50)
//            make.bottom.equalTo(button.snp.top).offset(-10)
//            make.centerX.equalToSuperview()
//        }
//    }
    
    //ログインボタン
//    func setUpButton() {
//        let buttonSize: CGRect = CGRect(x: 100, y: 600,width: 200,height: 60)
//        self.button = UIButton(frame: buttonSize)
//        button.setTitle("ログイン", for: .normal)
//        button.backgroundColor = UIColor.cyan
//        button.setTitleColor(.systemBlue, for: .normal)
//
//        self.addSubview(button)
//        button.snp.makeConstraints { make in
//            let width: CGFloat = self.frame.width
//            print(width)
//            make.width.equalTo(200)
//            make.height.equalTo(50)
//            make.center.equalToSuperview()
//        }
//    }
//

    

}
