//
//  PostBookReviewModel.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/05/23.
//

import Foundation
import Alamofire

protocol PostBookReviewProtocol {
    func postBookReview(postBookData: Dictionary<String,String>)
}

class PostBookReviewModel: PostBookReviewProtocol {
    func postBookReview(postBookData: Dictionary<String,String>) {
        let headers = self.createHeaders()
        let url = "https://api-for-missions-and-railways.herokuapp.com/books"
        
        AF.request(url, method: .post, parameters: postBookData, encoding: JSONEncoding.default, headers: headers).responseData { response in
            switch response.result {
            case .success(let data):
                do{
                    print("data:\(String(data: data, encoding: .utf8)!)")
                    //completion(token)
                } catch {
                    print("エラー")
                }
                
            case .failure(let err):
                print("error:\(err)")
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