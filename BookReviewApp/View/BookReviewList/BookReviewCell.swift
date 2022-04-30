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
        //setupcellLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        contentView.backgroundColor = .clear
        backgroundColor = .clear
    }
    
    lazy var bookStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLavel, reviewerLabel])
        stackView.axis = .vertical
        stackView.spacing = 2
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    //背景
    let backView: UIView = { () -> UIView in
        let view = UIView()
        view.backgroundColor = UIColor.systemGray
        view.layer.cornerRadius = 5
        return view
    }()
    
    //タイトル
    let titleLavel: UILabel = { () -> UILabel in
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.backgroundColor = UIColor.brown
        return label
    }()
    
    //紹介文
    let detailTextView: UITextView = { () -> UITextView in
        let textView = UITextView()
        textView.backgroundColor = .red
        return textView
    }()
    
    //レビューした人
    let reviewerLabel: UILabel = { () -> UILabel in
        let label = UILabel()
        label.backgroundColor = .green
        return label
    }()
    
    //レビュー文
    let reviewLabel: UITextView = { () -> UITextView in
        let label = UITextView()
        return label
    }()
    
    private func setBacView() -> Void {
        
        self.addSubview(bookStackView)
        bookStackView.snp.makeConstraints {
            $0.width.equalToSuperview().multipliedBy(0.8)
            $0.height.equalTo(contentView.snp.height).multipliedBy(0.9)
            $0.center.equalToSuperview()
        }
    }
    
    func setupCell(name: String, detail: String) -> Void {
        DispatchQueue.main.async {
            self.titleLavel.text = name
            self.reviewerLabel.text = detail
        }
    }
    
}
