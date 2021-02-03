//
//  ViewController.swift
//  HW3
//
//  Created by Nikita Zharinov on 02/02/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
    }
    
    @IBAction func unwindSeguetoLoginScreen(segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func forgotInfoAlertButton(_ sender: UIButton) {
        switch sender.tag {
        case 0: forgotInfoMessage(with: "No Problem!", and: "Your username is User")
        case 1: forgotInfoMessage(with: "No Problem!", and: "Your password is Password")
        default: break
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? UserInfoViewController else { return }
        destinationVC.userNameInfo = userNameTextField.text
//            sender as? String
    }
}

// MARK: - Alert Controler
extension ViewController {
    private func forgotInfoMessage(with alertTitle: String, and alertMessage: String) {
        let alertView = UIAlertController(
            title: alertTitle,
            message: alertMessage,
            preferredStyle: .alert
        )
        
        let okAlertButton = UIAlertAction(title: "OK", style: .default)
//        {
//            _ in self.textField.text = ""
//        }
        alertView.addAction(okAlertButton)
        present(alertView, animated: true)

    }
    
}

