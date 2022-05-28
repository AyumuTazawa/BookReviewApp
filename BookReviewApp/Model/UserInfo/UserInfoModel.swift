//
//  UserInfoModel.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/05/26.
//

import Foundation
import Alamofire

protocol userInfoDelegate {
    func editUserInfo(userData: Dictionary<String,String>, completion: @escaping (Token?) -> Void)
    func fetchUserInfo(completion: @escaping (UserName?) -> Void)
}

class UserInfoModel: userInfoDelegate {
    func editUserInfo(userData: Dictionary<String,String>, completion: @escaping (Token?) -> Void) {
        print(userData)
        var token: Token!
        let headers = self.createHeaders()
        let url = "https://api-for-missions-and-railways.herokuapp.com/users"
        AF.request(url, method: .put, parameters: userData, encoding: JSONEncoding.default, headers: headers).responseData { response in
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
    
    func fetchUserInfo(completion: @escaping (UserName?) -> Void) {
        var userName: UserName!
        var token = self.loadToken()!
        
        token = "Bearer \(token)"
        print(token)
        let headers: HTTPHeaders = [
            "Authorization": token
        ]
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
        var token = self.loadToken()!
        token = "Bearer \(token)"
        let headers: HTTPHeaders = [
            "Authorization": token
        ]
        
        return headers
    }
    
    
    func loadToken() -> String? {
        let id = "id"
        let key = "userToken"
        
        let query: [String: Any] = [
            kSecClass              as String: kSecClassGenericPassword,
            kSecAttrService        as String: key,
            kSecAttrAccount        as String: id,
            kSecMatchLimit         as String: kSecMatchLimitOne,
            kSecReturnAttributes   as String: true,
            kSecReturnData         as String: true,
        ]
        
        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        switch status {
        case errSecItemNotFound:
            return nil
        case errSecSuccess:
            guard let item = item,
                  let value = item[kSecValueData as String] as? Data else {
                      print("トークンデータなし")
                      return nil
                  }
            guard let loadString = String(data: value, encoding: .utf8) else {
                return nil
            }
            return loadString
        default:
            print("該当なし")
        }
        return nil
    }
}
