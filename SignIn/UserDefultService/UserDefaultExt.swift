//
//  UserDafultsExt.swift
//  Inlet
//
//  Created by Maxim Fedoseenko on 03.12.2023.
//

import Foundation

extension UserDefaults {
    
    // Enum `Keys` определяет ключи, которые будут использоваться для сохранения данных в UserDefaults.
    // Он реализует протоколы String (каждый case имеет строковое значение) и CaseIterable (позволяет перебирать все case).
    enum Keys: String, CaseIterable {
        case email
        case name
        case password
    }
    
    func reset() {
        // Итерируем через все случаи (case'ы) из enum Keys.
        for key in Keys.allCases {
            // Удаляем значение из UserDefaults по соответствующему ключу.
            removeObject(forKey: key.rawValue)
        }
    }
}

//Этот код предоставляет удобный способ сбросить все значения, связанные с определенными ключами, в UserDefaults. UserDefaults - это механизм для хранения небольших объемов данных между запусками вашего приложения.

//Предположим, вы используете UserDefaults для сохранения информации пользователя, такой как адрес электронной почты, имя и пароль. Когда пользователь выходит из приложения или выполняет какие-то действия, вы можете использовать метод reset, чтобы удалить все эти данные из UserDefaults и вернуться к начальному состоянию.
