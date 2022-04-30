//
//  SignInModel.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/02/23.
//

import SwiftUI
import Alamofire

protocol signInDelegate {
    
    func postSignInData(signindata: Dictionary<String,Any>)
    
}

class SignInModel: signInDelegate {
    
    func postSignInData(signindata: Dictionary<String,Any>) {
        print(signindata)
        var url = "https://api-for-missions-and-railways.herokuapp.com/signin"
//        AF.request(url, method: .post, parameters: signindata).response { response in
//            print(response)
//        }

    }

    
}
