//
//  TopView.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/02/03.
//

import UIKit
import SnapKit

class TopView: UIView {

    public var toLogInButton: UIButton! = {
        let button = UIButton()
        button.setTitle("ログイン", for: .normal)
        button.backgroundColor = UIColor.green
        button.setTitleColor(.systemBlue, for: .normal)
        
        return button
    }()
    
    public var toSignInButton: UIButton! = {
        let button = UIButton()
        button.setTitle("サインイン", for: .normal)
        button.backgroundColor = UIColor.systemBlue
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
        
       
        self.addSubview(toLogInButton)
        self.addSubview(toSignInButton)

        

        toLogInButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        
        toSignInButton.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(toLogInButton.snp.top).offset(-10)
        }
    }
}
