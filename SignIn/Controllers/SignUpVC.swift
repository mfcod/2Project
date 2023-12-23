//
//  SignUpVC.swift
//  SignIn
//
//  Created by Maxim Fedoseenko on 23.11.2023.
//

import UIKit

final class SignUpVC: UIViewController {
    
    
    @IBOutlet private weak var emailTF: UITextField!
    
    @IBOutlet private weak var errorLabel: UILabel!
    
    @IBOutlet private weak var nameTF: UITextField!
    
    @IBOutlet private weak var passwordTF: UITextField!
    
    @IBOutlet private weak var errorPassword: UILabel!
    
    @IBOutlet private var indicatorViews: [UIView]!
    
    @IBOutlet private weak var confirmPasswordTF: UITextField!
    
    @IBOutlet private weak var errorConfirmLabel: UILabel!
    
    @IBOutlet private weak var continueBtn: UIButton!
    
    /*
isValidEmail: Отслеживает допустимость введенного адреса электронной почты (булево значение). При изменении вызывает функцию updateBtnContinue(), возможно, обновляющую состояние кнопки.
isConfPass: Отслеживает, было ли введено подтверждение пароля (булево значение). При изменении вызывает функцию updateBtnContinue(), возможно, обновляющую состояние кнопки.
passwordStrengh: Отслеживает уровень сложности введенного пароля (перечисление PasswordStrength). При изменении вызывает функцию updateBtnContinue(), возможно, обновляющую состояние кнопки.
В общем, эти свойства предназначены, вероятно, для взаимодействия с пользовательским интерфейсом и обновления кнопки (btnContinue) в зависимости от изменений вводимых данных (адреса электронной почты, подтверждения пароля и уровня сложности пароля).
    //Код, который будет выполнен после установки нового значения updateBtnContinue
    //когда будет изменятся пишем didSet
     */
    
    private var isValidEmail = false { didSet { updateBtnContinue() }}
    private var isConfPass = false { didSet { updateBtnContinue() }}
    private var passwordStrengh: PasswordStrength = .veryWeak { didSet { updateBtnContinue() }}
    
    
    
    
    @IBAction func emailTFAction(_ sender: UITextField) {
        //if let email = sender.text проверяет, содержит ли sender.text значение. Если содержит, то это значение присваивается константе email, и код внутри блока if выполняется. Если sender.text равен nil, код внутри блока if пропускается.
        if let email = sender.text, !email.isEmpty,
           //Вызывается метод isValidEmail из класса VerificationService для проверки валидности(Действительности) электронной почты.
           VerificationService.isValidEmail(email: email) {
            isValidEmail = true
        } else {
            isValidEmail = false
        }
        errorLabel.isHidden = isValidEmail
    }
    
    
    
    @IBAction func passwordTFAction(_ sender: UITextField) {
        if let passText = passwordTF.text, !passText.isEmpty {
            passwordStrengh = VerificationService.isValidPassword(pass: passText)
            print(passwordStrengh)
        } else {
            passwordStrengh = .veryWeak
        }
        /*
        passwordStrengh != .veryWeak: Это условие проверки, которое означает "если уровень сложности пароля НЕ равен .veryWeak". Таким образом, это условие истинно, если уровень сложности пароля не является .veryWeak.
        errorPassword.isHidden = ...: Значение результата условия присваивается свойству isHidden объекта errorPassword. isHidden — это свойство, которое определяет, будет ли объект скрыт в пользовательском интерфейсе. Если isHidden равно true, объект скрыт; если false, объект отображается.
        
        Таким образом, эта строка кода гласит: "Сделай объект errorPassword видимым (т.е., isHidden = false), если уровень сложности пароля не является .veryWeak; в противном случае скрой его (т.е., isHidden = true)".

        По сути, вы скрываете объект errorPassword, когда пароль считается "очень слабым". Если пароль имеет другой уровень сложности, то errorPassword будет видимым.
        */
        errorPassword.isHidden = passwordStrengh != .veryWeak
        setupIndicatorsViews()
    }
    
    
    @IBAction func confirmTFAction(_ sender: UITextField) {
        if let confPassText = sender.text, !confPassText.isEmpty,
           let passText = passwordTF.text, !passText.isEmpty {
            isConfPass = VerificationService.isPassConfirm(pass1: passText, pass2: confPassText)
        } else {
            isConfPass = false
        }
        errorConfirmLabel.isHidden = isConfPass
    }
    
    
    @IBAction func signInAction(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    @IBAction func continueBtnAction(_ sender: UIButton) {
        //Это гарантирует, что если emailTF.text или passwordTF.text равны nil, код внутри оператора if не будет выполнен.
        if let email  = emailTF.text,
           let password = passwordTF.text {
            //Здесь вы создаете экземпляр структуры UserModul. Похоже, что вы используете значения из текстовых полей (nameTF.text, email и password) для инициализации структуры.
            let userModule = UserModel(name: nameTF.text, email: email, password: password)
            let vcXIB = SecretCodeVC(nibName: "SecretCodeVC", bundle: nil)
            navigationController?.pushViewController(vcXIB, animated: true)
        }
        //Итак, по сути, ваш код захватывает ввод пользователя (имя, электронную почту и пароль) из текстовых полей при касании кнопки и создает экземпляр структуры UserModul с этой информацией. Структура UserModul может использоваться для представления и организации данных о пользователе в вашем приложении. Стоит отметить, что свойство name в UserModul является опциональным, что означает, что оно может быть nil. 
    }
    
    private func setupIndicatorsViews() {
        for (index, view) in indicatorViews.enumerated() {
            //Таким образом, чтобы согласовать индексы массива с этими значениями, -1 используется при сравнении. В контексте вашего кода, index представляет собой индекс элемента в массиве, а passwordStrength.rawValue - 1 представляет числовое значение, соответствующее уровню силы пароля.
            
            //Поэтому, если index меньше или равно passwordStrength.rawValue - 1, это означает, что элемент с этим индексом и все предыдущие элементы в массиве indicatorViews будут видимыми (с полной непрозрачностью).
            if index <= (passwordStrengh.rawValue - 1) {
                view.alpha = 1
            } else {
                view.alpha = 0.3
            }
        }
    }
    
    private  func updateBtnContinue() {
        continueBtn.isEnabled = isValidEmail && isConfPass && passwordStrengh != .veryWeak
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
       
        
    }

    private func setupUI() {
        for view in indicatorViews {
            view.alpha = 0.3
        }
        errorLabel.isHidden = true
        errorPassword.isHidden = true
        errorConfirmLabel.isHidden = true
        continueBtn.isEnabled = false
    }
}
