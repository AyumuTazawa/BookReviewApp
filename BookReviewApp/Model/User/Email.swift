//
//  Email.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/06/14.
//

import Foundation

class Email {
    
    let value: String
    
    init (email: String) {
        self.value = email
    }
    
    func toString() -> String {
        return self.value
    }
}
