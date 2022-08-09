//
//  BookDetail.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/08/01.
//

import Foundation

class BookDetail {

    let value: String
    
    init (value: String) {
        self.value = value
    }

    func toString() -> String {
        return self.value
    }
}
