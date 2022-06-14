//
//  UserName.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/05/28.
//

import Foundation

class UserName {
    
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func toString() -> String {
        return self.name
    }
    
    func makePostData() -> Dictionary<String,String> {
        var editUserInfodata: Dictionary<String,String> = [:]
        editUserInfodata["name"] = self.name
        
        return editUserInfodata
    }
}
