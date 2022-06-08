//
//  UserInfoView.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/02/28.
//

import UIKit
import SnapKit

class UserInfoView: UIView {
    
    public var editUserInfoButton: UIButton! = { () -> UIButton in
        let button = UIButton()
        button.setTitle("ユーザー情報更新", for: .normal)
        button.backgroundColor = UIColor.cyan
        button.setTitleColor(.systemBlue, for: .normal)
        
        return button
    }()
    
    let nameTextField: UITextField = { () -> UITextField in
        let mailTextField = UITextField()
        mailTextField.placeholder = "ユーザー名"
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
        self.addSubview(editUserInfoButton)
        self.addSubview(nameTextField)

        editUserInfoButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        
        nameTextField.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(editUserInfoButton.snp.top).offset(-50)
        }
    }
}
