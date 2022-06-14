//
//  Login.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/06/14.
//

import Foundation

class Login {
    
    let email: Email
    let passward: Password
    
    init(email: Email, password: Password) {
        self.email = email
        self.passward = password
    }
    
    func postData() -> Dictionary<String, String> {
        var postData: Dictionary<String, String> = [:]
        postData["email"] = self.email.toString()
        postData["password"]  = self.passward.toString()
        
        return postData
    }
}
