//
//  UserName.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/05/28.
//

import Foundation

class UserName {
    
    let value: String
    
    init(name: String) {
        self.value = name
    }
    
    func toString() -> String {
        return self.value
    }
    
    func makePostData() -> Dictionary<String,String> {
        var editUserInfodata: Dictionary<String,String> = [:]
        editUserInfodata["name"] = self.value
        
        return editUserInfodata
    }
}
