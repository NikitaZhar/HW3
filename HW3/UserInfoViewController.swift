//
//  UserInfoViewController.swift
//  HW3
//
//  Created by Nikita Zharinov on 03/02/2021.
//

import UIKit

class UserInfoViewController: UIViewController {

    @IBOutlet var userLabel: UILabel!
    
    var userNameInfo: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userLabel.text = "Hello " + userNameInfo
    }
}
