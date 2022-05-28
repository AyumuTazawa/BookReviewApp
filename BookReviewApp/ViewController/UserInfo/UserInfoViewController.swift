//
//  UserInfoViewController.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/05/28.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    var errMessage: [String] = []
    var userInfoData: Dictionary<String, String> = [:]
    var userInfoView: UserInfoView = UserInfoView()
    var userInfoModel: UserInfoModel = UserInfoModel()
    
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
        self.userInfoModel.fetchUserInfo { completion in
            self.userInfoView.nameTextField.text =  completion?.name
        }
    }
    
    @objc func didTapUserInfoButton() {
        let name = self.userInfoView.nameTextField.text!
        self.userInfoData = [
            "name": name
        ]
        self.userInfoModel.editUserInfo(userData: userInfoData) { completion in
            self.userInfoView.nameTextField.text =  completion?.name
        }
    }
    
}
