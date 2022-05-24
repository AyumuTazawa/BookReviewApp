//
//  LoginModel.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/02/21.
//
import Alamofire
import Foundation

protocol LoginDelegate {
    
    func logIn(logIndata: Dictionary<String,String>, completion: @escaping (Token?) -> Void)
    
}

class LoginModel: LoginDelegate {
    func logIn(logIndata: Dictionary<String, String>, completion: @escaping (Token?) -> Void) {
        var token: Token!
        let url = "https://api-for-missions-and-railways.herokuapp.com/signin"
        AF.request(url, method: .post, parameters: logIndata, encoding: JSONEncoding.default, headers: nil).responseData { response in
            switch response.result {
            case .success(let data):
                do{
                    print(data)
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
