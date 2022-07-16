//
//  BookApiCliant.swift.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/06/08.
//

import Foundation
import Alamofire
import UIKit

protocol BookApiClientProtocol {
    func fetchBooks(offset: String, completion: @escaping ([Book]?) -> Void)
    func postBookReview(postBookData: Dictionary<String,String>)
    func fetchDetailBookReview(id: String, completion: @escaping (Book?) -> Void)
    func editBookReview(id: String, putBookData: BookModel, completion: @escaping (Book) -> Void)
    func deleteBookReview(id: String)
}

class BookApiClient: BookApiClientProtocol {
    
    let userToken: UserToken = UserToken()
    let headers: HTTPHeaders
    
    init() {
        self.headers = self.userToken.getHeaders()
    }
    
    
    func fetchBooks(offset: String, completion: @escaping ([Book]?) -> Void) {
        var book: [Book]!
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
    
    
    func postBookReview(postBookData: Dictionary<String, String>) {
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
    
    
    func fetchDetailBookReview(id: String, completion: @escaping (Book?) -> Void) {
        var book: Book!
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
    
    
    func editBookReview(id: String, putBookData: BookModel, completion: @escaping (Book) -> Void) {
        let url = "https://api-for-missions-and-railways.herokuapp.com/books/\(id)"
        AF.request(url, method: .put, parameters: putBookData.toArray(), encoding: JSONEncoding.default, headers: headers).responseData { response in
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
    
    func deleteBookReview(id: String) {
        let url = "https://api-for-missions-and-railways.herokuapp.com/books/\(id)"
        AF.request(url, method: .delete, encoding: JSONEncoding.default, headers: headers).responseData { response in
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
    
}
