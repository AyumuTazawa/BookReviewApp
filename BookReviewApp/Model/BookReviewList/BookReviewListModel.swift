//
//  fetchBookListModel.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/05/22.
//

import Alamofire
import JavaScriptCore

protocol BookReviewListProtocol {
    func fetchBooks(offset: String, completion: @escaping ([Book]?) -> Void)
}

class BookReviewListModel: BookReviewListProtocol {
    func fetchBooks(offset: String, completion: @escaping ([Book]?) -> Void) {
        var book: [Book]!
        var token = self.loadToken()!
        
        token = "Bearer \(token)"
        print(token)
        let headers: HTTPHeaders = [
            "Authorization": token
        ]
        let url = "https://api-for-missions-and-railways.herokuapp.com/books?offset=\(offset)"
        AF.request(url, method: .get, headers: headers).responseJSON { response in
            guard let data = response.data else { return }
            do {
                book = try JSONDecoder().decode([Book].self, from: data)
                completion(book)
            } catch {
                print(response.error)
            }
        }
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
