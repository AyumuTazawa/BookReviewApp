//
//  BookReviewDetailViewController.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/05/14.
//

import UIKit
import SnapKit

class DetailBookReviewViewController: UIViewController {

    let id: String
    var bookReviewDetailView: DetailBookReviewView = DetailBookReviewView()
    var bookApiClient: BookApiClient = BookApiClient()
    let loadingCircle: LoadingCircle = LoadingCircle()
    
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
        self.navigationController?.navigationBar.isTranslucent = false
        extendedLayoutIncludesOpaqueBars = false
        self.tabBarController?.tabBar.isTranslucent = false
        setUpView()
        executeFetchBook(id: self.id)
        
    }
    
    func setUpView() {
        bookReviewDetailView.backgroundColor = .systemGray5
        self.view.addSubview(bookReviewDetailView)
        
        bookReviewDetailView.snp.makeConstraints { make in
            make.edges.equalTo(view).inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
    }
    
    func setUpUIData(data: Book) {
        self.bookReviewDetailView.bookTitleLabel.text = data.title
        self.bookReviewDetailView.bookURLLabel.text = data.url
        self.bookReviewDetailView.bookDetailLabel.text = data.detail
        self.bookReviewDetailView.bookReviewerLabel.text = data.reviewer
        self.bookReviewDetailView.bookReviewLabel.text = data.review
    }
    
    func executeFetchBook(id: String) {
        self.loadingCircle.showIndicator()
        self.bookApiClient.fetchDetailBookReview(id: id) { [self] completion in
            let fetchData = completion!
            self.loadingCircle.stopIndicator()
            setUpUIData(data: fetchData)
        }
    }

}
