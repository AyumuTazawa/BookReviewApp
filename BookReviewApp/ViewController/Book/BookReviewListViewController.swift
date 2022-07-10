//
//  BookReviewListViewController.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/03/09.
//

import UIKit
import SnapKit

class BookReviewListViewController: UIViewController {
    var bookDataList: [Book] = []
    let bookApiClient: BookApiClient = BookApiClient()
    let loadingCircle: LoadingCircle = LoadingCircle()
    //スクリーンの横幅、縦幅を定義
    let screenWidth = Int(UIScreen.main.bounds.size.width)
    let screenHeight = Int(UIScreen.main.bounds.size.height)
    let bookReviewTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isTranslucent = false
        extendedLayoutIncludesOpaqueBars = false
        view.backgroundColor = .white
        navigationItem.title = "Center"
        
        self.tabBarController?.tabBar.isTranslucent = false
        
        setupUI()
        executeFetchBooks()
        
    }
    
    func setupUI() {
        bookReviewTableView.delegate = self
        bookReviewTableView.dataSource = self
        bookReviewTableView.rowHeight = UITableView.automaticDimension
        bookReviewTableView.register(BookReviewCell.self, forCellReuseIdentifier: "cell")
        bookReviewTableView.separatorStyle = .none
        bookReviewTableView.backgroundColor = .systemMint
        view.addSubview(bookReviewTableView)
        
        bookReviewTableView.snp.makeConstraints { make in
            make.edges.equalTo(view).inset(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        }
    }
    
    func executeFetchBooks() {
        self.loadingCircle.showIndicator()
        self.bookApiClient.fetchBooks(offset: "20") { completion in
            print(completion)
            self.bookDataList = completion!
            self.loadingCircle.stopIndicator()
            self.bookReviewTableView.reloadData()
        }
    }
}



extension BookReviewListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return bookDataList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.estimatedRowHeight
        
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BookReviewCell
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
        if bookDataList.count == 0 {
            
            return cell
        } else {
            let bookData = bookDataList[indexPath.row]
            //cell.setupCell(name: name, detail: datail, reviewer: reviewer, review: review)
            let reviewer = "by " + bookData.reviewer!
            cell.titleLabel.text = bookData.title
            cell.detailLabel.text = bookData.detail
            cell.detailLabel.sizeToFit()
            cell.reviewerLabel.text = reviewer
            cell.reviewLabel.text = bookData.review
            cell.reviewLabel.sizeToFit()
            //cell.setupCell(title: name)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected")
        let selectedBookReview = self.bookDataList[indexPath.row]
        if selectedBookReview.isMine == true {
            self.toEditBookReview(id: selectedBookReview.id!)
        } else {
            self.toDetailBookReview(id: selectedBookReview.id!)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func toEditBookReview(id: String) {
        let editBookReviewViewController = EditBookReviewViewController(id: id)
        self.present(editBookReviewViewController, animated: true, completion: nil)
    }
    
    func toDetailBookReview(id: String) {
        let detailBookReviewViewController = DetailBookReviewViewController(id: id)
        navigationController?.pushViewController(detailBookReviewViewController, animated: true)
    }
    
}
