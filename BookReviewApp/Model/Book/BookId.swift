//
//  BookId.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/07/29.
//

import Foundation

class BookId {
    
    let value: String
    
    init (email: String) {
        self.value = email
    }
    
    func toString() -> String {
        return self.value
    }
}
