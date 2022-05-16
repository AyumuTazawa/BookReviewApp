//
//  Validation.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/03/07.
//

import Foundation
import CoreVideo
import UIKit

enum ValidationResult {
    case valid
    case empty
    case overCharacter
    case unusableCharacters
    
    var isValid: Bool {
        switch self {
        case .valid:
            return true
        case .empty:
            return false
        case .overCharacter:
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
        case .overCharacter:
            return "文字数制限を超えています"
        case .unusableCharacters:
            return "使用できない文字が含まれています"
        }
    }
}
class Validator {
    static let shared: Validator = .init()
    private init(){}
    
    public func checkName(name: String?, min: Int, max: Int) -> ValidationResult {
        guard let name = name, !name.isEmpty else { return .empty }
        guard name.count >= min && name.count <= max else { return .overCharacter }
        let pattern = "[^a-zA-Z0-9ぁ-んァ-ー亜-黑]"
        if name.range(of: pattern, options: .regularExpression) != nil { return .unusableCharacters }
        return .valid
    }
    
    public func checkMail(mail: String?) -> ValidationResult {
        guard let mail: String = mail, !mail.isEmpty else { return .empty }
        //guard mail.count >= min && mail.count <= max else { return .overCharacter }
        let pattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+/.[A-Za-z]{2,6}"
        if mail.range(of: pattern, options: .regularExpression) != nil { return .unusableCharacters }
        return .valid
        
    }
    
    public func checkPassword(password: String?, min: Int, max: Int) -> ValidationResult {
        guard let password = password, !password.isEmpty else { return .empty }
        guard password.count >= min && password.count <= max else { return .overCharacter }
        let pattern = "[^a-zA-Z0-9]"
        if password.range(of: pattern, options: .regularExpression) != nil { return .unusableCharacters }
        return .valid
    }
    
    public func checkTitle(title: String?, min: Int, max: Int) -> ValidationResult {
        guard let title = title, !title.isEmpty else { return .empty }
        guard title.count >= min && title.count <= max else { return .overCharacter }
        let pattern = "[^a-zA-Z0-9ぁ-んァ-ー亜-黑]"
        if title.range(of: pattern, options: .regularExpression) != nil { return .unusableCharacters }
        return .valid
    }
    
    public func checkURL(url: String?, min: Int, max: Int) -> ValidationResult {
        guard let url = url, !url.isEmpty else { return .empty }
        guard url.count >= min && url.count <= max else { return .overCharacter }
        let pattern = "[^a-zA-Z0-9ぁ-んァ-ー亜-黑]"
        if url.range(of: pattern, options: .regularExpression) != nil { return .unusableCharacters }
        return .valid
    }
    
    public func checkDetail(detail: String?, min: Int, max: Int) -> ValidationResult {
        guard let detail = detail, !detail.isEmpty else { return .empty }
        guard detail.count >= min && detail.count <= max else { return .overCharacter }
        let pattern = "[^a-zA-Z0-9ぁ-んァ-ー亜-黑]"
        if detail.range(of: pattern, options: .regularExpression) != nil { return .unusableCharacters }
        return .valid
    }

    public func checkReview(review: String?, min: Int, max: Int) -> ValidationResult {
        guard let review = review, !review.isEmpty else { return .empty }
        guard review.count >= min && review.count <= max else { return .overCharacter }
        let pattern = "[^a-zA-Z0-9ぁ-んァ-ー亜-黑]"
        if review.range(of: pattern, options: .regularExpression) != nil { return .unusableCharacters }
        return .valid
    }
}
