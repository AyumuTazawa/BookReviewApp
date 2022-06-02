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
        let userToken: UserToken = UserToken()
        let headers = userToken.getHeaders()
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
}
