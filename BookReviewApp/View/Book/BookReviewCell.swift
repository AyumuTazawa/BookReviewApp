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
        setBacView()
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
        view.backgroundColor = UIColor.systemGreen
        view.layer.cornerRadius = 5
        return view
    }()
    
    //タイトル
    let titleLabel: UILabel = { () -> UILabel in
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        //label.backgroundColor = UIColor.brown
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    
    //紹介文
    let detailLabel: UILabel = { () -> UILabel in
        let label = UILabel()
        //label.backgroundColor = .red
        label.numberOfLines = 4
        return label
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
    
    func setBacView() {
        addSubview(backView)
        
        backView.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.98)
            make.height.equalToSuperview().multipliedBy(0.97)
            make.center.equalToSuperview()
            
        }
    }
    
    func setLayout() {
        backView.addSubview(titleLabel)
        backView.addSubview(detailLabel)
        backView.addSubview(reviewerLabel)
        backView.addSubview(reviewLabel)
        
        titleLabel.snp.makeConstraints { (make) in
            make.height.equalTo(35)
            make.width.equalToSuperview().multipliedBy(0.999).multipliedBy(0.95)
            make.centerX.equalToSuperview()
            make.top.equalTo(+0.5)
            ////make.left.equalTo(+0.5)
        }
        detailLabel.snp.makeConstraints { make in
            make.height.equalTo(100)
            make.width.equalToSuperview().multipliedBy(0.999)
            make.top.equalTo(titleLabel.snp.bottom).offset(0.1)
            make.centerX.equalToSuperview()
            //make.left.equalTo(+0.5)
        }
        reviewerLabel.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.width.equalToSuperview().multipliedBy(0.999)
            make.top.equalTo(detailLabel.snp.bottom).offset(0.1)
            make.centerX.equalToSuperview()
            //make.left.equalTo(+0.5)
        }
        reviewLabel.snp.makeConstraints { make in
            make.height.equalTo(150)
            make.width.equalToSuperview().multipliedBy(0.999)
            make.top.equalTo(reviewerLabel.snp.bottom).offset(0.1)
            make.centerX.equalToSuperview()
            //make.left.equalTo(+0.5)
        }
    }
    
    func setupCell(title: String) {
        titleLabel.text = title
    }
    
}
