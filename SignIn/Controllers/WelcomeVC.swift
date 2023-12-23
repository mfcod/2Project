//
//  WelcomeVC.swift
//  SignIn
//
//  Created by Maxim Fedoseenko on 28.11.2023.
//

import UIKit

final class WelcomeVC: UIViewController {

    @IBOutlet private weak var welcomeLbl: UILabel!
    @IBOutlet private weak var nameLbl: UILabel!
    @IBOutlet private weak var nextBtn: UIButton!
    
    var userModel: UserModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        navigationController?.navigationBar.isHidden = true
    }


    @IBAction func nextAction(_ sender: UIButton) {
        guard let userModel = userModel else { return }
        UserDefultsService.saveUserModel(userModel: userModel)
        navigationController?.popToRootViewController(animated:true)
    }
    
    private func setupUI() {
        nameLbl.text = "\(userModel?.name ?? "") to our Cool App"
    }
}
