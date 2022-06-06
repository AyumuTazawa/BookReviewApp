//
//  DetailBookReviewModel.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/06/06.
//

import Foundation
import Alamofire

protocol DetailBookReviewModelProtocol {
    func fetchDetailBookReview(id: String, completion: @escaping (Book?) -> Void)
}

class DetailBookReviewModel {
    func fetchBooks(id: String, completion: @escaping (Book?) -> Void) {
        var book: Book!
        let userToken: UserToken = UserToken()
        let headers = userToken.getHeaders()
        let url = "https://api-for-missions-and-railways.herokuapp.com/books/\(id)"
        AF.request(url, method: .get, headers: headers).responseJSON { response in
            guard let data = response.data else { return }
            do {
                book = try JSONDecoder().decode(Book.self, from: data)
                completion(book)
            } catch {
                print(response.error)
            }
        }
    }
    
}
