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
        view.backgroundColor = .systemMint

        return view
    }()

    //本のタイトル
    let bookTitleLabel: UILabel = { () -> UILabel in
        let label = UILabel()
        //label.text = "タイトル"
        label.backgroundColor = .systemFill
        return label
    }()

    //URL
    let bookURLLabel: UILabel = { () -> UILabel in
        let label = UILabel()

        return label
    }()

    //紹介文
    let bookDetailLabel: UILabel = { () -> UILabel in
        let label = UILabel()
        //label.text = "紹介文"
        label.backgroundColor = .blue
        return label
    }()

    //レビューワー
    let bookReviewerLabel: UILabel = { () -> UILabel in
        let label = UILabel()
        //label.text = "レビューワー"
        return label
    }()

    //レビュー
    let bookReviewLabel: UILabel = { () -> UILabel in
        let label = UILabel()
        //label.text = "レビュー"
        label.backgroundColor = .gray
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
        self.addSubview(centerView)

        self.addSubview(topView)
        topView.addSubview(bookTitleLabel)
        topView.addSubview(bookDetailLabel)

        self.addSubview(bottomView)
        bottomView.addSubview(bookURLLabel)
        bottomView.addSubview(bookReviewerLabel)
        bottomView.addSubview(bookReviewLabel)


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
            make.bottom.equalTo(centerView.snp.top)
        }

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

        bottomView.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.95)
            make.height.equalToSuperview().multipliedBy(0.48)
            make.centerX.equalToSuperview()
            make.top.equalTo(centerView.snp.bottom)
        }

        bookURLLabel.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.95)
            make.height.equalToSuperview().multipliedBy(0.1)
            make.centerX.equalToSuperview()
            make.top.equalTo(bottomView.snp.top)
        }

        bookReviewerLabel.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.95)
            make.height.equalToSuperview().multipliedBy(0.1)
            make.centerX.equalToSuperview()
            make.top.equalTo(bookURLLabel.snp.bottom)
        }

        bookReviewLabel.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.95)
            make.height.equalToSuperview().multipliedBy(0.8)
            make.centerX.equalToSuperview()
            make.top.equalTo(bookReviewerLabel.snp.bottom)
        }
    }

}
