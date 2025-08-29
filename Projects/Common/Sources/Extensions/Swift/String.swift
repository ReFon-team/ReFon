//
//  File.swift
//  MyCommon
//
//  Created by Вадим Мартыненко on 08.06.2025.
//

import Foundation

public extension String {
    
    var isLowercase: Bool {
        self.contains { $0.isLowercase }
    }
    
    var isUppercase: Bool {
        self.contains { $0.isUppercase }
    }
    
    var isNumber: Bool {
        self.contains { $0.isNumber }
    }
    
    var isSpecialCharacter: Bool {
        self.rangeOfCharacter(from: .symbols) != nil || self.rangeOfCharacter(from: .punctuationCharacters) != nil
    }
    
    func isMinLength(_ minLength: Int) -> Bool {
        self.count >= minLength
    }
    
    var isValidEmail: Bool {
        let emailRegex = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,64}$"#  ///blyjop.2006@sаubdomain.example.com
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: self)
    }
    
    var isNotEmpty: Bool {
        !isEmpty
    }
    
    static var empty: String {
        ""
    }
    
    static var rubleSign: String {
        "₽"
    }
    
    static var space: String {
        " "
    }
    
    static var plusSign: String {
        "+"
    }
    
    static var minusSign: String {
        "-"
    }
    
    static var comma: String {
        ", "
    }
    
    static var colon: String {
        ": "
    }
    
    enum LocationSign {
        case start, end
    }
    
    func appendRubleSign(withSpacer isSpacer: Bool = false, locationSign: LocationSign = .end) -> String {
        let spacer: String = isSpacer ? .space : .empty
        
        switch locationSign {
        case .end: return self + spacer + .rubleSign
        case .start: return .rubleSign + spacer + self
        }
    }
}
