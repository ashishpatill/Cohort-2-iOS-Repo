//
//  ChatVC.swift
//  Programmatic Navigation
//
//  Created by Ashish Pisey on 11/01/22.
//

import UIKit

class ChatVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(self.navigationController?.viewControllers)
        NotificationCenter.default.post(name: NotificationManager.shared.getRegisterNotificationName(), object: nil, userInfo: ["name":"Pulkit"])
        self.navigationController?.popToRootViewController(animated: true)
    }

}
