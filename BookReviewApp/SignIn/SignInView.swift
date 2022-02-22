//
//  SignInView.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/02/22.
//

import UIKit
import SnapKit

class SignInView: UIView {
    
    //サインインボタン
    var signInButton: UIButton! = {
        let button = UIButton()
        button.setTitle("サインイン", for: .normal)
        button.backgroundColor = UIColor.cyan
        button.setTitleColor(.systemBlue, for: .normal)
        
        return button
    }()
    
    //名前
    let nameTextField: UITextField = {
        let nameTextField = UITextField()
        nameTextField.placeholder = "お名前を入力してください"
        nameTextField.borderStyle = .roundedRect
        return nameTextField
    }()

    //メールアドレス
    let emailTextField: UITextField = {
        let mailTextField = UITextField()
        mailTextField.placeholder = "メールアドレスを入力してください"
        mailTextField.borderStyle = .roundedRect
        return mailTextField
    }()
    
    //確認用メールアドレス
    private let confirmationEmailTextField: UITextField = {
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
        self.addSubview(signInButton)
        self.addSubview(nameTextField)
        self.addSubview(emailTextField)
        self.addSubview(confirmationEmailTextField)
        
        signInButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        
        nameTextField.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(confirmationEmailTextField.snp.top).offset(-20)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(signInButton.snp.top).offset(-20)
        }
        
        confirmationEmailTextField.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(emailTextField.snp.top).offset(-20)
        }
    }
    
}

