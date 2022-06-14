//
//  UserApiClient.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/06/08.
//

import Foundation
import Alamofire

protocol UserApiClientProtocol {
    func postSignInData(signindata: SignIn, completion: @escaping (Token?) -> Void)
    func logIn(logIndata: Login, completion: @escaping (Token?) -> Void)
    func fetchUserInfo(completion: @escaping (UserNameStruct?) -> Void)
    func editUserInfo(userData: UserName, completion: @escaping (UserNameStruct?) -> Void)
}

class UserApiClient {
    
    let userToken: UserToken = UserToken()
    let headers: HTTPHeaders
    
    init() {
        self.headers = self.userToken.getHeaders()
    }
    
    func postSignInData(signindata: SignIn, completion: @escaping (Token?) -> Void) {
        print(signindata)
        var token: Token!
        let url = "https://api-for-missions-and-railways.herokuapp.com/users"
        AF.request(url, method: .post, parameters: signindata.makePostData(), encoding: JSONEncoding.default, headers: nil).responseData { response in
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
    
    
    func logIn(logIndata: Login, completion: @escaping (Token?) -> Void) {
        var token: Token!
        let url = "https://api-for-missions-and-railways.herokuapp.com/signin"
        AF.request(url, method: .post, parameters: logIndata.postData(), encoding: JSONEncoding.default, headers: nil).responseData { response in
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
    
    
    func fetchUserInfo(completion: @escaping (UserNameStruct?) -> Void) {
        var userName: UserNameStruct!
        let headers = self.userToken.getHeaders()
        let url = "https://api-for-missions-and-railways.herokuapp.com/users"
        AF.request(url, method: .get, headers: headers).responseJSON { response in
            guard let data = response.data else { return }
            do {
                userName = try JSONDecoder().decode(UserNameStruct.self, from: data)
                completion(userName)
            } catch {
                print(response.error)
            }
        }
    }
    
    
    func editUserInfo(userData: UserName, completion: @escaping (UserNameStruct?) -> Void) {
        print(userData)
        var name: UserNameStruct!
        let headers = self.userToken.getHeaders()
        let url = "https://api-for-missions-and-railways.herokuapp.com/users"
        AF.request(url, method: .put, parameters: userData.makePostData(), encoding: JSONEncoding.default, headers: headers).responseData { response in
            switch response.result {
            case .success(let data):
                do{
                    name = try JSONDecoder().decode(UserNameStruct.self, from: data)
                    print("data:\(String(data: data, encoding: .utf8)!)")
                    completion(name)
                } catch {
                    print("エラー")
                }
                
            case .failure(let err):
                print("error:\(err)")
            }
        }
    }
}
