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
        
    private let authorizedUser = "User"
    private let authorizedPassword = "Password"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let userInfoVC = segue.destination as? UserInfoViewController else { return }
        userInfoVC.userNameInfo = authorizedUser
    }
    
     @IBAction func unwindSeguetoLoginScreen(segue: UIStoryboardSegue) {
        userNameTextField.text = nil
        passwordTextField.text = nil
    }
 
    @IBAction func loginButtonPressed() {
        if userNameTextField.text != authorizedUser ||
           passwordTextField.text != authorizedPassword {
            forgotAlert(
                with: "Invalid login or password!",
                and: "Please, enter correct login and password"
            )
            passwordTextField.text = nil
            return
        }
        performSegue(withIdentifier: "userInfoSegue", sender: nil)
    }
    
    @IBAction func forgotInfoAlertButton(_ sender: UIButton) {
        switch sender.tag {
        case 0: forgotAlert(with: "No Problem!", and: "Your username is \(authorizedUser)")
        case 1: forgotAlert(with: "No Problem!", and: "Your password is \(authorizedPassword)")
        default: break
        }
    }
}

extension ViewController {

    // MARK: - Alert Controler
    private func forgotAlert(with alertTitle: String, and alertMessage: String) {
        let alertView = UIAlertController(
            title: alertTitle,
            message: alertMessage,
            preferredStyle: .alert
        )
        let okAlertButton = UIAlertAction(title: "OK", style: .default)
        alertView.addAction(okAlertButton)
        present(alertView, animated: true)
    }
    
// MARK: - Keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            loginButtonPressed()
        }
        return true
    }
}
