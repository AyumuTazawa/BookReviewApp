//
//  Login.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/01/13.
//

import UIKit
import SnapKit

class Login: UIView {
    
    public var logInButton: UIButton! = { () -> UIButton in
        let button = UIButton()
        button.setTitle("ログイン", for: .normal)
        button.backgroundColor = UIColor.cyan
        button.setTitleColor(.systemBlue, for: .normal)
        
        return button
    }()
    
    let emailTextField: UITextField = { () -> UITextField in
        let mailTextField = UITextField()
        mailTextField.placeholder = "メールアドレスを入力してください"
        mailTextField.borderStyle = .roundedRect
        return mailTextField
    }()
    
    let passwordTextField: UITextField = { () -> UITextField in
        let mailTextField = UITextField()
        mailTextField.placeholder = "確認メールアドレスを入力してください"
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
        self.addSubview(passwordTextField)

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
        
        passwordTextField.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(emailTextField.snp.top).offset(-50)
        }
    }

}
