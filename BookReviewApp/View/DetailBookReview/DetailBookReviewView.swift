//
//  BookReviewDetail.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/05/14.
//

import UIKit

class DetailBookReviewView: UIView {
    
    //項目名:本のタイトル
    var bookTitleItemLabel: UILabel = { () -> UILabel in
        let label: UILabel = UILabel()
        label.text = "タイトル："
        return label
    }()
    //本のタイトル
    let bookTitleLabel: UILabel = { () -> UILabel in
        let label = UILabel()
        label.text = "タイトル"
        return label
    }()
    
    //項目名:URL
    var bookURLItemLabel: UILabel = { () -> UILabel in
        let label: UILabel = UILabel()
        label.text = "URL："
        return label
    }()
    
    //URL
    let bookURLLabel: UILabel = { () -> UILabel in
        let label = UILabel()
        label.text = "URL"
        return label
    }()
    
    //項目名:紹介文
    var bookDetailItemLabel: UILabel = { () -> UILabel in
        let label: UILabel = UILabel()
        label.text = "紹介文："
        //label.backgroundColor = .green
        return label
    }()
    
    //紹介文
    let bookDetailLabel: UILabel = { () -> UILabel in
        let label = UILabel()
        label.text = "紹介文"
        //label.backgroundColor = .blue
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
        label.text = "レビューワー"
        return label
    }()
    
    //項目名:レビュー
    var bookReviewItemLabel: UILabel = { () -> UILabel in
        let label: UILabel = UILabel()
        label.text = "レビュー："
        return label
    }()
    
    //レビュー
    let bookReviewLabel: UILabel = { () -> UILabel in
        let label = UILabel()
        label.text = "レビュー"
        return label
    }()
    
    let spaceAdjustmentLabel: UILabel = { () -> UILabel in
        let label = UILabel()
        //label.backgroundColor = .red
        return label
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
        self.addSubview(spaceAdjustmentLabel)
        self.addSubview(bookTitleItemLabel)
        self.addSubview(bookTitleLabel)
        self.addSubview(bookURLItemLabel)
        self.addSubview(bookURLLabel)
        self.addSubview(bookDetailItemLabel)
        self.addSubview(bookDetailLabel)
        self.addSubview(bookReviewerItemLabel)
        self.addSubview(bookReviewerLabel)
        self.addSubview(bookReviewItemLabel)
        self.addSubview(bookReviewLabel)

        
        spaceAdjustmentLabel.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(0)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        bookDetailItemLabel.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(spaceAdjustmentLabel.snp.top)
        }
        
        bookURLLabel.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(bookDetailItemLabel.snp.top).offset(-20)
        }
        
        bookURLItemLabel.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(bookURLLabel.snp.top).offset(-20)
        }
        
        bookTitleLabel.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(bookURLItemLabel.snp.top).offset(-20)
        }
        
        bookTitleItemLabel.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(bookTitleLabel.snp.top).offset(-20)
        }
        
        bookDetailLabel.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(spaceAdjustmentLabel.snp.bottom)
        }
        
        bookReviewerItemLabel.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(bookDetailLabel.snp.bottom).offset(20)
        }
        
        bookReviewerLabel.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(bookReviewerItemLabel.snp.bottom).offset(20)
        }
        
        bookReviewItemLabel.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(bookReviewerLabel.snp.bottom).offset(20)
        }
        
        bookReviewLabel.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(bookReviewItemLabel.snp.bottom).offset(20)
        }
    }
    
}
