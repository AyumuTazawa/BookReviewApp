//
//  saveUserToken.swift.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/06/02.
//

import Foundation

class SaveUserToken {
    
    func saveToken(token: String) -> Bool {
            let id = "id"
            let key = "userToken"
            guard let data = token.data(using: .utf8) else {
                return false
            }
            
            let query: [String: Any] = [
                kSecClass              as String: kSecClassGenericPassword,
                kSecAttrService        as String: key,
                kSecAttrAccount        as String: id,
                kSecValueData          as String: data,
            ]
            let status = SecItemCopyMatching(query as CFDictionary, nil)
            
            var itemUpdateStatus: OSStatus?
            
            print(status)

            switch status {
            case errSecItemNotFound:
                itemUpdateStatus = SecItemAdd(query as CFDictionary, nil)

            case errSecSuccess:
                itemUpdateStatus = SecItemUpdate(query as CFDictionary, [kSecValueData as String: data] as CFDictionary)

            default:
                print("該当なし")
            }
            
            if itemUpdateStatus == errSecSuccess {
                print("キーチェーンにトークン保存完了")
            } else {
                return false
            }
            return true
        }
    
}
