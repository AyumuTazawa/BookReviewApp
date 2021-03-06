//
//  UserInfoViewController.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/05/28.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    var errMessage: [String] = []
    var userInfoView: UserInfoView = UserInfoView()
    var userApiClient: UserApiClient = UserApiClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setUpView()
        setUpButton()
        setUpUserInfoData()
    }
    
    
    func setUpView() {
        let width = self.view.bounds.width
        let height = self.view.bounds.height
        userInfoView.frame = CGRect(x: 0, y: 0, width: width, height: height)
        self.view.addSubview(userInfoView)
    }
    
    func setUpButton() {
        userInfoView.editUserInfoButton.addTarget(self,
                                                  action: #selector(didTapUserInfoButton),
                                                  for: .touchDown)
    }
    
    func setUpUserInfoData() {
            self.userInfoView.nameTextField.text =  executeFetchUserInfo()
    }
    
    func executeFetchUserInfo() -> String {
        var name: String!
        self.userApiClient.fetchUserInfo { completion in
            name = completion?.name
        }
        return  name
    }
    
    @objc func didTapUserInfoButton() {
        let name = UserName(name: self.userInfoView.nameTextField.text!)
        self.executeEditUserInfo(name: name)
    }
    
    func executeEditUserInfo(name: UserName) {
        self.userApiClient.editUserInfo(userData: name) { completion in
            self.userInfoView.nameTextField.text =  completion?.name
        }
    }
}
