//
//  PostBookReviewViewController.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/05/14.
//

import UIKit

class PostBookReviewViewController: UIViewController {
    var postBookReview: PostBookReviewView = PostBookReviewView()
    var bookApiClient: BookApiClient = BookApiClient()
    let loadingCircle: LoadingCircle = LoadingCircle()
    var errMessage: [String] = []
    var registerBookArray: Dictionary<String, String> = [:]

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setUpView()
        setUpButton()
    }
    
    func setUpView() {
        let width = self.view.bounds.width
        let height = self.view.bounds.height
        postBookReview.frame = CGRect(x: 0, y: 0, width: width, height: height)
        self.view.addSubview(postBookReview)
    }
    
    func setUpButton() {
        postBookReview.bookRegisterButton.addTarget(self,
                                          action: #selector(didTapBookRegisterButton),
                                          for: .touchDown)
    }
    
    @objc func didTapBookRegisterButton() {
        let title = postBookReview.bookTitleTextField.text!
        let url = postBookReview.bookURLTextField.text!
        let detail = postBookReview.bookDetailTextField.text!
        let review = postBookReview.bookReviewTextField.text!
        let boolModel: RegisterBookModel = RegisterBookModel(
              title: title
            , url: url
            , detail: detail
            , review: review
        )
        
        let checkValidationResult: Bool = executeValidationChek(data: boolModel.toArray())
        self.loadingCircle.showIndicator()
        if(checkValidationResult) {
            self.bookApiClient.postBookReview(registerBookModel: boolModel)
            self.loadingCircle.stopIndicator()
        }
        
    }
    
    func executeValidationChek(data: Dictionary<String, String>) -> Bool {
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
            print("バリデーションチェック成功")
            return true
        }else{
            print(errMessage)
            return false
        }
        
    }

}
