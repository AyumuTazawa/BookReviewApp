//
//  BookReviewListViewController.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/03/09.
//

import UIKit

class BookReviewListViewController: UIViewController {
    var bookList: [String] = ["呪術廻戦1巻", "呪術廻戦2巻", "呪術廻戦3巻", "呪術廻戦4巻", "呪術廻戦5巻"]
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
        bookReviewTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(bookReviewTableView)
        self.bookReviewTableView.rowHeight = 100
    }

}

extension BookReviewListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = bookList[indexPath.row]
        return cell
    }
    
    
}
