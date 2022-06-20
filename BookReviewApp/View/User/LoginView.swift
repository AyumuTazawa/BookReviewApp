//
//  Login.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/01/13.
//

import UIKit
import SnapKit

class LoginView: UIView {
    
    let adjustmentView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemCyan
        
        return view
    }()
    
    let labelBackView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        
        return view
    }()
    
    let buttonBackView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemPink
        
        return view
    }()
    
    public var logInButton: UIButton! = { () -> UIButton in
        let button = UIButton()
        button.setTitle("ログイン", for: .normal)
        button.backgroundColor = UIColor.cyan
        button.setTitleColor(.systemBlue, for: .normal)
        
        return button
    }()
    
    let emailTextField: UITextField = { () -> UITextField in
        let mailTextField = UITextField()
        mailTextField.placeholder = "メールアドレス"
        mailTextField.borderStyle = .roundedRect
        return mailTextField
    }()
    
    let passwordTextField: UITextField = { () -> UITextField in
        let mailTextField = UITextField()
        mailTextField.placeholder = "パスワード"
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
        self.addSubview(adjustmentView)
        self.addSubview(labelBackView)
        self.addSubview(buttonBackView)
        
        labelBackView.addSubview(emailTextField)
        labelBackView.addSubview(passwordTextField)
        
        buttonBackView.addSubview(logInButton)
        
        adjustmentView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(10)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        labelBackView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.35)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(adjustmentView.snp.top)
        }
        
        buttonBackView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.4)
            make.centerX.equalToSuperview()
            make.top.equalTo(adjustmentView.snp.bottom)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(labelBackView.snp.bottom).offset(-10)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(passwordTextField.snp.top).offset(-10)
        }
        
        logInButton.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(buttonBackView.snp.top).offset(0).offset(10)
        }
    }
    
}
