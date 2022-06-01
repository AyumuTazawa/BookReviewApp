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
        let userToken: UserToken = UserToken()
        let headers = userToken.getHeaders()
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
    
}
