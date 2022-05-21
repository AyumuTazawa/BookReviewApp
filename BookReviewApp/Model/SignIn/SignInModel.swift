//
//  SignInModel.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/02/23.
//

import SwiftUI
import Alamofire

protocol signInDelegate {
    
    func postSignInData(signindata: Dictionary<String,String>, completion: @escaping (Token?) -> Void)
    
}

class SignInModel: signInDelegate {
    
    func postSignInData(signindata: Dictionary<String,String>, completion: @escaping (Token?) -> Void) {
        print(signindata)
        var token: Token!
        let url = "https://api-for-missions-and-railways.herokuapp.com/users"
        AF.request(url, method: .post, parameters: signindata, encoding: JSONEncoding.default, headers: nil).responseData { response in
            switch response.result {
            case .success(let data):
                do{
                    token = try JSONDecoder().decode(Token.self, from: data)
                    print("data:\(String(data: data, encoding: .utf8)!)")
                    completion(token)
                } catch {
                    print("エラー")
                }
                
            case .failure(let err):
                print("error:\(err)")
            }
        }
    }
}
