//
//  SecretCodeVC.swift
//  SignIn
//
//  Created by Maxim Fedoseenko on 24.11.2023.
//

import UIKit

final class SecretCodeVC: UIViewController {

    var userModel: UserModel?
    let randomInt = Int.random(in: 1000...9999)
    var sleepTime = 3
    
    @IBOutlet private weak var infoLabel: UILabel!
    
    @IBOutlet private weak var secterCodeTF: UITextField!
    
    @IBOutlet private weak var errorLabel: UILabel!
    
    
    @IBOutlet weak var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        hideKeyboardWhenTappedAround()
    }
    
    @IBAction func nextAction(_ sender: UIButton) {
        let vcXIB = SecretCodeVC(nibName: "SignInVC", bundle: nil)
        navigationController?.pushViewController(vcXIB, animated: true)
    }
    
    @IBAction func codeTFAction(_ sender: UITextField) {
        errorLabel.isHidden = true
        guard let text = sender.text,
              !text.isEmpty,
              text == randomInt.description else {
            
            errorLabel.isHidden = false
            sender.isUserInteractionEnabled = false
            errorLabel.text = "Error code. Please wait \(sleepTime) seconds"
            
            let dispatcAfter = DispatchTimeInterval.seconds(sleepTime)
            let deadline = DispatchTime.now() + dispatcAfter
            DispatchQueue.main.asyncAfter (deadline: deadline) {
                sender.isUserInteractionEnabled = true
                self.errorLabel.isHidden = true
                self.sleepTime *= 2
            }
            return
        }
        
        
        /*
         Этот код представляет собой обработчик события, вызываемый при изменении текста в поле ввода кода (codeTF). Давайте разберем его шаг за шагом:

         errorLabel.isHidden = true: Скрывает метку (errorLabel), предназначенную для отображения сообщения об ошибке.
         guard let text = sender.text, !text.isEmpty, text == randomInt.description else {: Использует конструкцию guard для проверки следующих условий:
         Проверяет, что текст введенного кода (text) не является пустым.
         Проверяет, что введенный код совпадает с ранее сгенерированным случайным числом (randomInt).
         Если одно из условий не выполняется, код внутри блока else выполняется:
         errorLabel.isHidden = false: Показывает метку с сообщением об ошибке.
         sender.isUserInteractionEnabled = false: Блокирует ввод для предотвращения дополнительных попыток ввода.
         errorLabel.text = "Error code. Please wait \(sleepTime) seconds": Устанавливает текст сообщения об ошибке с указанием времени ожидания.
         Создается задача, которая будет выполнена после определенного времени:
         let dispatchAfter = DispatchTimeInterval.seconds(sleepTime): Определяет интервал времени задержки.
         let deadline = DispatchTime.now() + dispatchAfter: Устанавливает момент времени, когда задача должна выполниться.
         DispatchQueue.main.asyncAfter(deadline: deadline) { ... }: Асинхронно запускает блок кода после указанного времени.
         Внутри этого блока:
         sender.isUserInteractionEnabled = true: Разблокирует поле ввода.
         self.errorLabel.isHidden = true: Снова скрывает метку с сообщением об ошибке.
         self.sleepTime *= 2: Удваивает время ожидания для следующей попытки ввода.
         return: Завершает функцию в случае неудачной проверки введенного кода.
         Этот код реализует логику проверки введенного кода, отображения сообщения об ошибке и блокировки ввода на некоторое время в случае неверного ввода.
         */
    }
    
    
    private func setupUI() {
        infoLabel.text = "Please enter your code \(randomInt) from \(userModel?.email ?? "") "
    }

}
