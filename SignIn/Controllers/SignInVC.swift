//
//  SignInVC.swift
//  SignIn
//
//  Created by Maxim Fedoseenko on 23.11.2023.
//

import UIKit

final class SignInVC: UIViewController {
    
    @IBOutlet private weak var emailTF: UITextField!
    @IBOutlet private weak var passwordTF: UITextField!
    @IBOutlet private weak var errorLabel: UILabel!
    @IBOutlet private weak var signBtn: UIButton!
    @IBOutlet private weak var scrollView: UIScrollView!
    
    private var isVallidEmail = false
    private var isConfPass = false
    
    @IBAction private func newAccountBtn(_ sender: UIButton) {
        let vcXIB = SignUpVC(nibName: "SignUpVC", bundle: nil)
        navigationController?.pushViewController(vcXIB, animated: true)
        //Этот код создает экземпляр контроллера представления (SignUpVC) с использованием XIB-файла, указанного в качестве "SignUpVC". Это обычно используется для инициализации и отображения нового экрана
    }
    
    @IBAction func emailTFAction(_ sender: UITextField) {
        if let textEmail = sender.text, !textEmail.isEmpty,
           VerificationService.isValidEmail(email: textEmail) {
            isVallidEmail = true
        } else {
            isVallidEmail = false
        }
        errorLabel.isHidden = isVallidEmail
    }
    
    @IBAction func passwordTFAction(_ sender: UITextField) {
        if let textPassword = passwordTF.text, !textPassword.isEmpty {
            signBtn.isEnabled = true
        } else {
            signBtn.isEnabled = false
        }
    }
    
    @IBAction func signBtnAction(_ sender: UIButton) {
        if let email = emailTF.text,
           let password = passwordTF.text {
            let userModule = UserModel(name: "WelcomeVC", email: email, password: password)
            let vcXib = WelcomeVC(nibName: "WelcomeVC", bundle: nil)
            navigationController?.pushViewController(vcXib, animated: true)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        startKeyboardObserver()
        hideKeyboardWhenTappedAround()
    }
    
    private func startKeyboardObserver() {
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        }
    @objc private func keyboardWillShow(notification: Notification) {
            guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
                return
            }
            let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
            scrollView.contentInset = contentInsets
            scrollView.scrollIndicatorInsets = contentInsets
        }

        @objc private func keyboardWillHide() {
            let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
            scrollView.contentInset = contentInsets
            scrollView.scrollIndicatorInsets = contentInsets
        }
    
    private func setupUI() {
        signBtn.isEnabled = false
        errorLabel.isHidden = true
        
    }
    уауцауцауцауца
    укпукпукц
    пук
    пук
    пукп
    укпуцк
    п
    ку
    пцукцпукпкупук
    п
    
    упукпукппцкпук
    
}

