//
//  BookReviewEditViewController.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/05/14.
//

import UIKit

class EditBookReviewViewController: UIViewController {

    let id: String
    var editBookReviewView: EditBookReviewView = EditBookReviewView()
    var bookApiClient: BookApiClient = BookApiClient()
    let loadingCircle: LoadingCircle = LoadingCircle()
    var errMessage: [String] = []

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
        setUpButton()
        executeFetchBook(id: self.id)
    }

    func setUpView() {
        let width = self.view.bounds.width
        let height = self.view.bounds.height
        editBookReviewView.frame = CGRect(x: 0, y: 0, width: width, height: height)
        self.view.addSubview(editBookReviewView)
    }
    
    func setUpButton() {
        editBookReviewView.bookUpdateButton.addTarget(self,
                                                      action: #selector(didTapBookUpdateButton),
                                                      for: .touchDown)
    }

    func setUpUIData(data: Book) {
        self.editBookReviewView.bookTitleTextField.text = data.title
        self.editBookReviewView.bookURLTextField.text = data.url
        self.editBookReviewView.bookDetailTextView.text = data.detail
        self.editBookReviewView.bookReviewTextView.text = data.review
    }
    
    @objc func didTapBookUpdateButton() {
        let bookModel = BookModel(id: self.id,
                                 title: editBookReviewView.bookTitleTextField.text!,
                                 url: editBookReviewView.bookURLTextField.text!,
                                 detail: editBookReviewView.bookDetailTextView.text!,
                                 review: editBookReviewView.bookReviewTextView.text!,
                                 isMine: true)
        executeValidationChek(data: bookModel)
        print(self.id)
        executeEditBookReview(id: self.id, putBookData: bookModel)
    }

    func executeFetchBook(id: String) {
        self.loadingCircle.showIndicator()
        self.bookApiClient.fetchDetailBookReview(id: id) { [self] completion in
            let fetchData = completion!
            self.loadingCircle.stopIndicator()
            setUpUIData(data: fetchData)
        }
    }

    func executeEditBookReview(id: String, putBookData: BookModel) {
        self.bookApiClient.editBookReview(id: id, putBookData: putBookData) { [self]  completion in
            let data = completion
            setUpUIData(data: data)
        }
        
    }

    func executeValidationChek(data: BookModel) -> Void {
        self.errMessage.removeAll()
        
        //let checkTitle = Validator.shared.checkTitle(title: data["title"], min: 5, max: 30)
        //if(checkTitle.isValid == false){ errMessage.append(checkTitle.isError) }
        
        //let checkURL = Validator.shared.checkURL(url: data["url"], min: 5, max: 500)
        //if(checkURL.isValid == false){ errMessage.append(checkURL.isError) }
        
        let checkDetail = Validator.shared.checkTitle(title: data.toDetail(), min: 5, max: 500)
        if(checkDetail.isValid == false){ errMessage.append(checkDetail.isError) }
        
        let checkReview = Validator.shared.checkTitle(title: data.toReview(), min: 5, max: 500)
        if(checkReview.isValid == false){ errMessage.append(checkReview.isError) }
        
        if (errMessage.isEmpty){
            //signInModel.postSignInData(signindata: signindata)
            //            let view = UIHostingController(rootView: UserInfoView())
            //            self.present(view, animated: true, completion: nil)
            //dialog.showDialog(vc: self, massegae: "テスト")
            //self.signInModel.postSignInData(signindata: data)
            print("成功")
        }else{
            print(errMessage)
        }
    }
    
}
