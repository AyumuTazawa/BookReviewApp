//
//  TokenModel.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/05/30.
//

import Foundation
import UIKit
import Alamofire

class UserToken {
    var userToken: String = ""
    
    init() {
        self.userToken = self.loadToken()!
    }
    
    func getUserToken() -> String {
        return self.userToken
    }
    
    func getHeaders() -> HTTPHeaders {
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(userToken)"
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
