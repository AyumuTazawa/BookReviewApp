//
//  TopView.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/02/03.
//

import UIKit
import SnapKit

class TopView: UIView {
    
    let adjustmentLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .red
        
        return label
    }()
    
    public var welcomeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = NSTextAlignment.center
        label.text = "Welcome"
        
        return label
    }()
    
    public var titleBackView: UIView = {
        let view =  UIView()
        view.backgroundColor = .yellow
        
        return view
    }()

    public var buttonBackView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        
        return view
    }()
    
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
        button.backgroundColor = UIColor.systemPink
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
        self.addSubview(adjustmentLabel)
        self.addSubview(titleBackView)
        titleBackView.addSubview(welcomeLabel)
        self.addSubview(buttonBackView)
        buttonBackView.addSubview(toLogInButton)
        buttonBackView.addSubview(toSignInButton)
        
        adjustmentLabel.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(10)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        titleBackView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.35)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(adjustmentLabel.snp.top)
        }
        
        welcomeLabel.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalToSuperview()
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        buttonBackView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.4)
            make.centerX.equalToSuperview()
            make.top.equalTo(adjustmentLabel.snp.bottom)
        }
        
        toLogInButton.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }

        toSignInButton.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(toLogInButton.snp.bottom).offset(10)
        }
    }
}
