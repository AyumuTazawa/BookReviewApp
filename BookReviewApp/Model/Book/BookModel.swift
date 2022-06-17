//
//  BookModel.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/06/17.
//

import Foundation

class BookModel {
    
    let id: String
    let titile: String
    let url: String
    let detail: String
    let review: String
    let reviewer: String
    let isMine: Bool
    
    init(id: String,
         title: String,
         url: String,
         detail: String,
         review: String,
         reviewer: String,
         isMine: Bool
    ) {
        self.id = id
        self.titile = title
        self.url = url
        self.detail = detail
        self.reviewer = reviewer
        self.review = review
        self.isMine = isMine
    }
    
}
