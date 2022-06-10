//
//  BookReviewCell.swift.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/03/11.
//

import Foundation
import UIKit
import SnapKit

class BookReviewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        contentView.backgroundColor = .clear
        backgroundColor = .clear
    }
    
    //背景
    let backView: UIView = { () -> UIView in
        let view = UIView()
        //view.backgroundColor = UIColor.systemGray
        view.layer.cornerRadius = 5
        return view
    }()
    
    //タイトル
    let titleLavel: UILabel = { () -> UILabel in
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        //label.backgroundColor = UIColor.brown
        return label
    }()
    
    //紹介文
    let detailLabel: UILabel = { () -> UILabel in
        let textView = UILabel()
        //textView.backgroundColor = .red
        return textView
    }()
    
    //レビューした人
    let reviewerLabel: UILabel = { () -> UILabel in
        let label = UILabel()
        label.backgroundColor = .green
        return label
    }()
    
    //レビュー文
    let reviewLabel: UILabel = { () -> UILabel in
        let label = UILabel()
        label.backgroundColor = .systemPink
        label.numberOfLines = 4
        return label
    }()
    
    func setLayout() {
        addSubview(titleLavel)
        addSubview(detailLabel)
        addSubview(reviewerLabel)
        addSubview(reviewLabel)
        
        titleLavel.snp.makeConstraints { (make) in
            make.height.equalTo(30)
            make.width.equalToSuperview().multipliedBy(0.95).multipliedBy(0.95)
            make.centerX.equalToSuperview()
            make.top.equalTo(+0.5)
            ////make.left.equalTo(+0.5)
        }
        detailLabel.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalToSuperview().multipliedBy(0.95)
            make.top.equalTo(titleLavel.snp.bottom).offset(0.1)
            make.centerX.equalToSuperview()
            //make.left.equalTo(+0.5)
        }
        reviewerLabel.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.width.equalToSuperview().multipliedBy(0.95)
            make.top.equalTo(detailLabel.snp.bottom).offset(0.1)
            make.centerX.equalToSuperview()
            //make.left.equalTo(+0.5)
        }
        reviewLabel.snp.makeConstraints { make in
            make.height.equalTo(95)
            make.width.equalToSuperview().multipliedBy(0.95)
            make.top.equalTo(reviewerLabel.snp.bottom).offset(0.1)
            make.centerX.equalToSuperview()
            //make.left.equalTo(+0.5)
        }
    }
    
    func setupCell(title: String) {
        titleLavel.text = title
    }
    
}
