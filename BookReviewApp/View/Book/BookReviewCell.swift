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
        setUpStackView()
        //setLayout()
        //setBacView()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        contentView.backgroundColor = .clear
        backgroundColor = .gray
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
        ////label.backgroundColor = UIColor.brown
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    
    //紹介文
    let detailLabel: UILabel = { () -> UILabel in
        let label = UILabel()
        label.backgroundColor = .red
        label.numberOfLines = 4
        label.font = UIFont(name: "PingFangHK-Regular", size: 15)
        return label
    }()
    
    //レビューした人
    let reviewerLabel: UILabel = { () -> UILabel in
        let label = UILabel()
        label.backgroundColor = .green
        label.font = UIFont(name: "AvenirNextCondensed-Italic", size: 20)
        return label
    }()
    
    //レビュー文
    let reviewLabel: UILabel = { () -> UILabel in
        let label = UILabel()
        label.backgroundColor = .systemPink
        label.numberOfLines = 6
        label.font = UIFont(name: "PingFangHK-Regular", size: 15)
        return label
    }()
    
    func setBacView() {
        addSubview(backView)
        backView.snp.makeConstraints { make in
            make.edges.equalTo(self).inset(UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2))
        }
    }
    
    let bacStackView: UIStackView = { () -> UIStackView in
        let stackView = UIStackView()
        stackView.backgroundColor = .yellow
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    func setUpStackView() {

        let stackView = UIStackView(arrangedSubviews: [titleLabel,
                                                       detailLabel,
                                                       reviewerLabel,
                                                       reviewLabel
                                                      ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = UIStackView.spacingUseSystem
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        //addSubview(bacStackView)
        //stackView.backgroundColor = .yellow
        titleLabel.snp.makeConstraints { (make) in
            make.height.equalTo(35)
            make.width.equalToSuperview().multipliedBy(0.95)
            make.centerX.equalToSuperview()
        }
        
        backView.addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.edges.equalTo(self).inset(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        }
    }
    
    func setLayout() {
        
        titleLabel.snp.makeConstraints { (make) in
            make.height.equalTo(35)
            make.width.equalToSuperview().multipliedBy(0.95)
            make.centerX.equalToSuperview()
            //make.top.equalTo(+0.5)
            //make.edges.equalTo(backView).inset(ConstraintInsets(top: 10, left: 10, bottom: 0, right: 10))
            ////make.left.equalTo(+0.5)
        }
        detailLabel.snp.makeConstraints { make in
            make.height.equalTo(100)
            make.width.equalToSuperview().multipliedBy(0.95)
            make.top.equalTo(titleLabel.snp.bottom).offset(0.1)
            make.centerX.equalToSuperview()
            //make.edges.equalTo(backView).inset(ConstraintInsets(top: 10, left: 10, bottom: 0, right: 10))
            //make.left.equalTo(+0.5)
        }
        reviewerLabel.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.width.equalToSuperview().multipliedBy(0.95)
            make.top.equalTo(detailLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            //make.edges.equalTo(backView).inset(ConstraintInsets(top: 10, left: 10, bottom: 0, right: 10))
            //make.left.equalTo(+0.5)
        }
        reviewLabel.snp.makeConstraints { make in
            //make.height.equalTo(130)
            make.width.equalToSuperview().multipliedBy(0.95)
            make.top.equalTo(reviewerLabel.snp.bottom).offset(0.1)
            make.centerX.equalToSuperview()
            //make.edges.equalTo(self).inset(UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10))
            //make.left.equalTo(+0.5)
        }
    }
    
    func setupCell(title: String) {
        titleLabel.text = title
    }
    
}
