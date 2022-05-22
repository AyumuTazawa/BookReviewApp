//
//  Bookl.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/05/22.
//

struct Books: Decodable {
    let books : [Book]
    

}

struct Book: Decodable {
    var id: String?
    var title: String?
    var url: String?
    var detail: String?
    var review: String?
    var reviewer: String?
}

