//
//  SignInView.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/02/22.
//

import UIKit
import SnapKit

class SignInView: UIView {
    
    let centerBackView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        
        return view
    }()
    
    let topBackView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemMint
        
        return view
    }()
    
    let bottomBackView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        
        return view
    }()
    
    //サインインボタン
    let signInButton: UIButton! = { () -> UIButton in
        let button = UIButton()
        button.setTitle("サインイン", for: .normal)
        button.backgroundColor = UIColor.cyan
        button.setTitleColor(.systemBlue, for: .normal)
        
        return button
    }()
    
    //名前
    let nameTextField: UITextField = { () -> UITextField in
        let nameTextField = UITextField()
        nameTextField.placeholder = "お名前を入力してください"
        nameTextField.borderStyle = .roundedRect
        return nameTextField
    }()

    //メールアドレス
    let emailTextField: UITextField = { () -> UITextField in
        let mailTextField = UITextField()
        mailTextField.placeholder = "メールアドレスを入力してください"
        mailTextField.borderStyle = .roundedRect
        return mailTextField
    }()
    
    //確認用メールアドレス
    let passwordTextField: UITextField = { () -> UITextField in
        let mailTextField = UITextField()
        mailTextField.placeholder = "パスワードを入力してください"
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
        
        self.addSubview(centerBackView)
        self.addSubview(topBackView)
        self.addSubview(bottomBackView)
        
        centerBackView.addSubview(passwordTextField)
        topBackView.addSubview(emailTextField)
        topBackView.addSubview(nameTextField)
        bottomBackView.addSubview(signInButton)
        
        
        
        centerBackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(50)
        }
        
        topBackView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.35)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(centerBackView.snp.top)
        }
        
        bottomBackView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.4)
            make.centerX.equalToSuperview()
            make.top.equalTo(centerBackView.snp.bottom)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        emailTextField.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(topBackView.snp.bottom).offset(-10)
        }
        
        nameTextField.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(emailTextField.snp.top).offset(-10)
        }
        
        signInButton.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(bottomBackView.snp.top).offset(10)
        }

    }
    
}

