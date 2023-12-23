//
//  ExitKeyboardVC.swift
//  SignIn
//
//  Created by Maxim Fedoseenko on 23.11.2023.
//

import UIKit


extension UIViewController{
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() { view.endEditing(true) }
}
