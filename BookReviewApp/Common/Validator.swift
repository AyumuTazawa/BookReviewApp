//
//  Validation.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/03/07.
//

import Foundation
import CoreVideo

enum ValidationResult {
    case valid
    case empty
    case overCharacterOver
    case unusableCharacters
    
    var isValid: Bool {
        switch self {
        case .valid:
            return true
        case .empty:
            return false
        case .overCharacterOver:
            return false
        case .unusableCharacters:
            return false
        }
    }
    
    var isError: String {
        switch self {
        case .valid:
            return ""
        case .empty:
            return "文字を入力してください"
        case .overCharacterOver:
            return "文字数制限を超えています"
        case .unusableCharacters:
            return "使用できない文字が含まれています"
        }
    }
}
    class Validator {
        func validate(value: String?) -> ValidationResult {
            if value!.isEmpty == true && value == nil {
                return .empty
            }
                return .valid
        }
    }
