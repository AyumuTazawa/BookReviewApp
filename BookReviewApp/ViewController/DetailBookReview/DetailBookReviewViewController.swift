//
//  BookReviewDetailViewController.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/05/14.
//

import UIKit

class DetailBookReviewViewController: UIViewController {

    let id: String
    var bookReviewDetailView = DetailBookReviewView()
    var detailBookReviewModel: DetailBookReviewModel = DetailBookReviewModel()
    
    init(id: String) {
        self.id = id
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setUpView()
        executeFetchBook(id: self.id)
        
    }
    
    func setUpView() {
        let width = self.view.bounds.width
        let height = self.view.bounds.height
        bookReviewDetailView.frame = CGRect(x: 0, y: 0, width: width, height: height)
        self.view.addSubview(bookReviewDetailView)
    }
    
    func setUpUIData(data: Book) {
        self.bookReviewDetailView.bookTitleLabel.text = data.title
        self.bookReviewDetailView.bookURLLabel.text = data.url
        self.bookReviewDetailView.bookDetailLabel.text = data.detail
        self.bookReviewDetailView.bookReviewerLabel.text = data.reviewer
        self.bookReviewDetailView.bookReviewLabel.text = data.review
    }
    
    func executeFetchBook(id: String) {
        self.detailBookReviewModel.fetchBooks(id: id) { [self] completion in
            let fetchData = completion!
            setUpUIData(data: fetchData)
        }
    }

}
