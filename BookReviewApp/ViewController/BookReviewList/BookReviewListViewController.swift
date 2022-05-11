//
//  BookReviewListViewController.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/03/09.
//

import UIKit

class BookReviewListViewController: UIViewController {
    var data: [String] = ["a", "b", "c", "d", "e", "f"]
    var bookList: [String] = ["呪術廻戦1巻", "呪術廻戦2巻", "呪術廻戦3巻", "呪術廻戦4巻", "呪術廻戦5巻"]
    var bookDetailData: [String] = ["テスト", "テスト", "テスト", "テスト", "テスト"]
    var reviewer: [String] = ["テスト", "テスト", "テスト", "テスト", "テスト"]
    var review: [String] = ["テストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテスト", "テスト", "テスト", "テスト", "テスト"]
    //スクリーンの横幅、縦幅を定義
    let screenWidth = Int(UIScreen.main.bounds.size.width)
    let screenHeight = Int(UIScreen.main.bounds.size.height)
    let bookReviewTableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
    }
    
    func setupUI() {
        bookReviewTableView.frame = CGRect(x:0,
                                           y:0,
                                           width:screenWidth,
                                           height:screenHeight)
        bookReviewTableView.delegate = self
        bookReviewTableView.dataSource = self
       // bookReviewTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        bookReviewTableView.register(BookReviewCell.self, forCellReuseIdentifier: "cell")
//        self.bookReviewTableView.rowHeight = 300
        self.bookReviewTableView.backgroundColor = .blue
        view.addSubview(bookReviewTableView)
        //self.bookReviewTableView.rowHeight = 300
    }

}

extension BookReviewListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(200)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BookReviewCell
        let name = bookList[indexPath.row]
        let detail = bookDetailData[indexPath.row]
        let reviewer = reviewer[indexPath.row]
        let review = review[indexPath.row]
        
        //cell.setupCell(name: name, detail: datail, reviewer: reviewer, review: review)
        cell.titleLavel.text = name
        cell.detailLabel.text = detail
        cell.reviewerLabel.text = reviewer
        cell.reviewLabel.text = review
        //cell.setupCell(title: name)

        return cell
    }
    
}
