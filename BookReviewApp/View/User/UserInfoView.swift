//
//  UserInfoView.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/02/28.
//

import UIKit
import SnapKit

class UserInfoView: UIView {
    
    public let topBackView: UIView = { () -> UIView in
        let view: UIView = UIView()
        view.backgroundColor = .systemPink
        
        return view
    }()
    
    public let centerBackView: UIView = { () -> UIView in
        let view: UIView = UIView()
        view.backgroundColor = .systemMint
        
        return view
    }()
    
    public let bottomBackView: UIView = { () -> UIView in
        let view: UIView = UIView()
        view.backgroundColor = .systemBlue
        
        return view
    }()
    
    public let editUserInfoButton: UIButton! = { () -> UIButton in
        let button = UIButton()
        button.setTitle("ユーザー情報更新", for: .normal)
        button.backgroundColor = UIColor.cyan
        button.setTitleColor(.systemBlue, for: .normal)
        
        return button
    }()
    
    public let nameTextField: UITextField = { () -> UITextField in
        let mailTextField = UITextField()
        mailTextField.placeholder = "ユーザー名"
        mailTextField.borderStyle = .roundedRect
        mailTextField.becomeFirstResponder()
        
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
        
        topBackView.addSubview(nameTextField)
        bottomBackView.addSubview(editUserInfoButton)
        
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
            make.height.equalToSuperview().multipliedBy(0.35)
            make.centerX.equalToSuperview()
            make.top.equalTo(centerBackView.snp.bottom)
        }
        
        nameTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(topBackView.snp.bottom).offset(-10)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(50)
        }
        
        editUserInfoButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(bottomBackView.snp.top).offset(0)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(50)
        }
    }
}
