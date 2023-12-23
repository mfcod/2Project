//
//  VerificationService.swift
//  SignIn
//
//  Created by Maxim Fedoseenko on 23.11.2023.
//

import Foundation

enum PasswordStrength: Int {
    case veryWeak
    case weak
    case notVeryWeak
    case notVeryStrong
    case strong
}

class VerificationService {
    static let weakRegex = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
    static let notVeryWeakRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,}$"
    static let notVeryStrongRegex = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$"
    static let strongRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[d$@$!%*?&#])[A-Za-z\\dd$@$!%*?&#]{8,}"
    
    /*static func isValidPassword(pass: String) -> PasswordStrength: Это объявление статического метода с именем isValidPassword, который принимает строку пароля и возвращает PasswordStrength.
    switch true: Это конструкция switch, которая оценивает различные уровни силы пароля на основе результата сравнения с регулярными выражениями.
    Каждый case в switch использует NSPredicate для сравнения строки пароля с определенным регулярным выражением и возвращает соответствующий PasswordStrength:
    case NSPredicate(format: "SELF MATCHES %@", strongRegex).evaluate(with: pass): return .strong
    case NSPredicate(format: "SELF MATCHES %@", notVeryStrongRegex).evaluate(with: pass): return .notVeryStrong
    case NSPredicate(format: "SELF MATCHES %@", notVeryWeakRegex).evaluate(with: pass): return .notVeryWeak
    case NSPredicate(format: "SELF MATCHES %@", weakRegex).evaluate(with: pass): return .weak
    default: return .veryWeak: Если ни одно из предыдущих условий не совпадает, возвращается уровень силы .veryWeak.
     */
    
    static func isValidPassword(pass: String) -> PasswordStrength {
        switch true {
        case NSPredicate(format: "SELF MATCHES %@", strongRegex).evaluate(with: pass):
            return .strong
        case NSPredicate(format: "SELF MATCHES %@", notVeryStrongRegex).evaluate(with: pass):
            return .notVeryStrong
        case NSPredicate(format: "SELF MATCHES %@", notVeryWeakRegex).evaluate(with: pass):
            return .notVeryWeak
        case NSPredicate(format: "SELF MATCHES %@", weakRegex).evaluate(with: pass):
            return .weak
        default:
            return .veryWeak
        }
    }

    //Этот код использует switch true, чтобы поочередно проверить каждое условие и вернуть соответствующее значение PasswordStrength. Каждый кейс содержит логику, аналогичную вашим исходным if-else if-блокам. Теперь код стал более лаконичным и легко читаемым.
    
    
    
    
    static func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
        //Таким образом, этот метод проверяет, соответствует ли переданная строка формату допустимого адреса электронной почты, используя регулярное выражение.
    }
    
    static func isPassConfirm(pass1: String, pass2: String) -> Bool {
        return pass1 == pass2
    }
}
