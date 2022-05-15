//
//  SignInModel.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/02/23.
//

import SwiftUI
import Alamofire

protocol signInDelegate {
    
    func postSignInData(signindata: Dictionary<String,String>)
    
}

class SignInModel: signInDelegate {
    
    func postSignInData(signindata: Dictionary<String,String>) {
        print(signindata)
        var token: Token!
        var url = "https://api-for-missions-and-railways.herokuapp.com/signin"
        AF.request(url, method: .get, parameters: signindata).responseData { response in
            guard let data = response.data else { return }
            switch response.result {
            case .success(let data):
                print("data:\(String(data: data, encoding: .utf8)!)")
            case .failure(let err):
                print("error:\(err)")
            }
        }
    }
}
