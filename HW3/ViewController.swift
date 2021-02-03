//
//  ViewController.swift
//  HW3
//
//  Created by Nikita Zharinov on 02/02/2021.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButtonLabel: UIButton!
        
    @IBAction func loginButton(_ sender: UIButton) {
        guard let userName = userNameTextField.text,
              !userName.isEmpty else { return }
        
        loginButtonLabel.setTitle("Next", for: .normal)
        userNameTextField.returnKeyType = .done
        
        guard let password = passwordTextField.text,
              !password.isEmpty else { return }
        
        if userName == "User", password == "Password" {
            performSegue(withIdentifier: "userInfoSegue", sender: nil)
        } else {
            forgotInfoMessage(with: "Invalid Login and Password",
                              and: "Please enter correct login and password")
        }
    }
    
    @IBAction func unwindSeguetoLoginScreen(segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
        loginButtonLabel.setTitle("Log In", for: .normal)
        userNameTextField.returnKeyType = UIReturnKeyType.default
    }
    
    @IBAction func forgotInfoAlertButton(_ sender: UIButton) {
        switch sender.tag {
        case 0: forgotInfoMessage(with: "No Problem!", and: "Your username is User")
        case 1: forgotInfoMessage(with: "No Problem!", and: "Your password is Password")
        default: break
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        loginButtonLabel.setTitle("Next", for: .normal)
        textField.returnKeyType = .done
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        loginButton(loginButtonLabel)
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let userInfoVC = segue.destination as? UserInfoViewController else { return }
        userInfoVC.userNameInfo = userNameTextField.text
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
        {
            _ in self.passwordTextField.text = ""
        }
        alertView.addAction(okAlertButton)
        present(alertView, animated: true)
    }
    
}
