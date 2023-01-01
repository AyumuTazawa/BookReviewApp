//
//  RegisterBookModel.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2023/01/01.
//

import Foundation

class RegisterBookModel {

    let title: String
    let url: String
    let detail: String
    let review: String

    init(title: String,
         url: String,
         detail: String,
         review: String
    ) {
        self.title = title
        self.url = url
        self.detail = detail
        self.review = review
    }

    func toDetail() -> String {
        return self.detail
    }
    
    func toReview() -> String {
        return self.review
    }

    func toArray() -> Dictionary<String, String> {
        let array: Dictionary<String, String> = [
            "title": self.title,
            "url": self.url,
            "detail": self.detail,
            "review": self.review
        ]
        return array
    }

}
