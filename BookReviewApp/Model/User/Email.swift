//
//  Email.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/06/14.
//

import Foundation

class Email {
    
    let email: String
    
    init (email: String) {
        self.email = email
    }
    
    func toString() -> String {
        return self.email
    }
}
