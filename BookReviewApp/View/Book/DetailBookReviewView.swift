//
//  BookReviewDetail.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/05/14.
//

import UIKit

class DetailBookReviewView: UIView {
    
    let topView: UIView = {
        let view = UIView()
        view.backgroundColor = .red

        return view
    }()
    
    let centerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemPurple

        return view
    }()
    
    let bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        
        return view
    }()

    //本のタイトル
    let bookTitleLabel: UILabel = { () -> UILabel in
        let label = UILabel()
        //label.text = "タイトル"
        label.backgroundColor = .systemFill
        return label
    }()
    
    //項目名:URL
    var bookURLItemLabel: UILabel = { () -> UILabel in
        let label: UILabel = UILabel()
        label.text = "URL："
        label.backgroundColor = .systemMint
        return label
    }()
    
    //URL
    let bookURLLabel: UILabel = { () -> UILabel in
        let label = UILabel()
        //label.text = "URL"
        return label
    }()

    //紹介文
    let bookDetailLabel: UILabel = { () -> UILabel in
        let label = UILabel()
        //label.text = "紹介文"
        label.backgroundColor = .blue
        return label
    }()
    
    //項目名:レビューワー
    var bookReviewerItemLabel: UILabel = { () -> UILabel in
        let label: UILabel = UILabel()
        label.text = "レビューワー："
        return label
    }()
    
    //レビューワー
    let bookReviewerLabel: UILabel = { () -> UILabel in
        let label = UILabel()
        //label.text = "レビューワー"
        return label
    }()
    
    //項目名:レビュー
    var bookReviewItemLabel: UILabel = { () -> UILabel in
        let label: UILabel = UILabel()
        label.text = "レビュー："
        label.backgroundColor = .systemPink
        return label
    }()
    
    //レビュー
    let bookReviewLabel: UILabel = { () -> UILabel in
        let label = UILabel()
        //label.text = "レビュー"
        label.backgroundColor = .gray
        return label
    }()
    
//    let spaceAdjustmentLabel: UILabel = { () -> UILabel in
//        let label = UILabel()
//        label.backgroundColor = .red
//        return label
//    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    func setup() {
        self.addSubview(centerView)
        self.addSubview(topView)
        topView.addSubview(bookTitleLabel)
        //self.addSubview(bookURLItemLabel)
        //self.addSubview(bookURLLabel)
        topView.addSubview(bookDetailLabel)
        //self.addSubview(bookReviewerItemLabel)
        //self.addSubview(bookReviewerLabel)
        //self.addSubview(bookReviewItemLabel)
        //self.addSubview(bookReviewLabel)

        
        centerView.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(0)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }

        topView.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.95)
            make.height.equalToSuperview().multipliedBy(0.48)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(centerView.snp.top).offset(-10)
        }

//        bookURLLabel.snp.makeConstraints { make in
//            make.width.equalToSuperview().multipliedBy(0.8)
//            make.height.equalTo(50)
//            make.centerX.equalToSuperview()
//            make.bottom.equalTo(bookDetailItemLabel.snp.top).offset(-10)
//        }
        
//        bookURLItemLabel.snp.makeConstraints { make in
//            make.width.equalToSuperview().multipliedBy(0.8)
//            make.height.equalTo(50)
//            make.centerX.equalToSuperview()
//            make.bottom.equalTo(bookURLLabel.snp.top).offset(-10)
//        }
        
        bookTitleLabel.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.2)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.top.equalTo(topView.snp.top).offset(5)
        }

        bookDetailLabel.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.8)
            make.centerX.equalToSuperview()
            make.top.equalTo(bookTitleLabel.snp.bottom)
        }
        
//        bookReviewerItemLabel.snp.makeConstraints { make in
//            make.width.equalToSuperview().multipliedBy(0.8)
//            make.height.equalTo(50)
//            make.centerX.equalToSuperview()
//            make.top.equalTo(bookDetailLabel.snp.bottom).offset(10)
//        }
        
//        bookReviewerLabel.snp.makeConstraints { make in
//            make.width.equalToSuperview().multipliedBy(0.8)
//            make.height.equalTo(50)
//            make.centerX.equalToSuperview()
//            make.top.equalTo(bookReviewerItemLabel.snp.bottom).offset(10)
//        }
        
//        bookReviewItemLabel.snp.makeConstraints { make in
//            make.width.equalToSuperview().multipliedBy(0.8)
//            make.height.equalTo(50)
//            make.centerX.equalToSuperview()
//            make.top.equalTo(bookReviewerLabel.snp.bottom).offset(10)
//        }
        
//        bookReviewLabel.snp.makeConstraints { make in
//            make.width.equalToSuperview().multipliedBy(0.8)
//            make.height.equalTo(50)
//            make.centerX.equalToSuperview()
//            make.top.equalTo(bookReviewItemLabel.snp.bottom).offset(10)
//        }
    }
    
}
