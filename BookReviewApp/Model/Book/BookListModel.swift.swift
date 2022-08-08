//
//  BookListModel.swift.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/06/17.
//

import Foundation

class BookListModel {
    var bookList:[BookModel] = []
    
    init(book: BookModel) {
        self.bookList.append(book)
    }
}
