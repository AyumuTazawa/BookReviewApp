//
//  BookReviewEditViewController.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/05/14.
//

import UIKit

class EditBookReviewViewController: UIViewController {
    
    var editBookReviewView = EditBookReviewView()
    var errMessage: [String] = []
    var updateBookArray: Dictionary<String, String> = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpView()
        setUpButton()
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
    
    @objc func didTapBookUpdateButton() {
        let title = editBookReviewView.bookTitleTextField.text!
        let url = editBookReviewView.bookURLTextField.text!
        let detail = editBookReviewView.bookDetailTextView.text!
        let review = editBookReviewView.bookReviewTextView.text!
        self.updateBookArray = [
            "title": title,
            "url": url,
            "detail": detail,
            "review": review
        ]
        executeValidationChek(data: updateBookArray)
    }
    
    func executeValidationChek(data: Dictionary<String, String>) -> Void {
        self.errMessage.removeAll()
        
        let checkTitle = Validator.shared.checkTitle(title: data["title"], min: 5, max: 30)
        if(checkTitle.isValid == false){ errMessage.append(checkTitle.isError) }
        
        let checkURL = Validator.shared.checkURL(url: data["url"], min: 5, max: 500)
        if(checkURL.isValid == false){ errMessage.append(checkURL.isError) }
        
        let checkDetail = Validator.shared.checkTitle(title: data["detail"], min: 5, max: 500)
        if(checkDetail.isValid == false){ errMessage.append(checkDetail.isError) }
        
        let checkReview = Validator.shared.checkTitle(title: data["review"], min: 5, max: 500)
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
