//
//  SignIn.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/06/14.
//

import Foundation

class SignIn {

    let name: UserName
    let email: Email
    let password: Password

    init(name: UserName, email: Email, password: Password) {
        self.name = name
        self.email = email
        self.password = password
    }

    func makePostData() -> Dictionary<String, String> {
        var signindata: Dictionary<String, String> = [:]
        signindata["name"] = self.name.toString()
        signindata["email"] = self.email.toString()
        signindata["password"] = self.password.toString()

        return signindata
    }
}
