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
    
    @IBAction func logOutButton() {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
