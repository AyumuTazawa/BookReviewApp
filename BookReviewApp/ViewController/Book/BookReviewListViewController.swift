//
//  BookReviewListViewController.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/03/09.
//

import UIKit

class BookReviewListViewController: UIViewController {
    var bookDataList: [Book] = []
    let bookApiClient: BookApiClient = BookApiClient()
    //スクリーンの横幅、縦幅を定義
    let screenWidth = Int(UIScreen.main.bounds.size.width)
    let screenHeight = Int(UIScreen.main.bounds.size.height)
    let bookReviewTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Center"
        setupUI()
        executeFetchBooks()
        
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
        view.addSubview(bookReviewTableView)
        //self.bookReviewTableView.rowHeight = 300
    }
    
    func executeFetchBooks() {
        self.bookApiClient.fetchBooks(offset: "10") { completion in
            print(completion)
            self.bookDataList = completion!
            self.bookReviewTableView.reloadData()
        }
    }
}



extension BookReviewListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookDataList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(200)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BookReviewCell
        //let name = bookList[indexPath.row]
        
        if bookDataList.count == 0 {
            
            return cell
        } else {
            let bookData = bookDataList[indexPath.row]
            //cell.setupCell(name: name, detail: datail, reviewer: reviewer, review: review)
            cell.titleLabel.text = bookData.title
            cell.detailLabel.text = bookData.detail
            cell.reviewerLabel.text = bookData.reviewer
            cell.reviewLabel.text = bookData.review
            //cell.setupCell(title: name)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected")
        let selectedBookReview = self.bookDataList[indexPath.row]
        if selectedBookReview.isMine == true {
            let id: String = selectedBookReview.id!
            let editBookReviewViewController = EditBookReviewViewController(id: id)
            self.present(editBookReviewViewController, animated: true, completion: nil)
        } else {
            let id: String = selectedBookReview.id!
            let detailBookReviewViewController = DetailBookReviewViewController(id: id)
            self.present(detailBookReviewViewController, animated: true, completion: nil)
        }
    }
}
