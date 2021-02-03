//
//  ViewController.swift
//  HW3
//
//  Created by Nikita Zharinov on 02/02/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func forgotMessageButton(_ sender: UIButton) {
        switch sender.tag {
        case 0: forgotMessage(with: "No Problem!", and: "Your username is User")
        case 1: forgotMessage(with: "No Problem!", and: "Your password is Password")
        default: break
        }
    }
    
}

extension ViewController {
    private func forgotMessage(with alertTitle: String, and alertMessage: String) {
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

