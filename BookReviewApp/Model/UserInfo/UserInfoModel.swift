//
//  UserInfoModel.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/05/26.
//

import Foundation
import Alamofire

protocol userInfoDelegate {
    func editUserInfo(userData: Dictionary<String,String>, completion: @escaping (UserName?) -> Void)
    func fetchUserInfo(completion: @escaping (UserName?) -> Void)
}

class UserInfoModel: userInfoDelegate {
    
    let userToken: UserToken = UserToken()
    
    func editUserInfo(userData: Dictionary<String,String>, completion: @escaping (UserName?) -> Void) {
        print(userData)
        var name: UserName!
        let headers = self.userToken.getHeaders()
        let url = "https://api-for-missions-and-railways.herokuapp.com/users"
        AF.request(url, method: .put, parameters: userData, encoding: JSONEncoding.default, headers: headers).responseData { response in
            switch response.result {
            case .success(let data):
                do{
                    name = try JSONDecoder().decode(UserName.self, from: data)
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
    
    func fetchUserInfo(completion: @escaping (UserName?) -> Void) {
        var userName: UserName!
        let headers = self.userToken.getHeaders()
        let url = "https://api-for-missions-and-railways.herokuapp.com/users"
        AF.request(url, method: .get, headers: headers).responseJSON { response in
            guard let data = response.data else { return }
            do {
                userName = try JSONDecoder().decode(UserName.self, from: data)
                completion(userName)
            } catch {
                print(response.error)
            }
        }
    }
    
    func createHeaders() -> HTTPHeaders {
        
        var token = userToken.getUserToken()
        token = "Bearer \(token)"
        let headers: HTTPHeaders = [
            "Authorization": token
        ]
        
        return headers
    }
}
