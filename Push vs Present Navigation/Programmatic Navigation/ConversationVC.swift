//
//  ConversationVC.swift
//  Programmatic Navigation
//
//  Created by Ashish Pisey on 11/01/22.
//

import UIKit

class ConversationVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setLeftBarButton(UIBarButtonItem.init(title: "Sign Out", style: .plain, target: self, action: #selector(signOut)), animated: false)
        self.navigationItem.title = "Conversation screen"
        // Do any additional setup after loading the view.
        print(self.navigationController?.viewControllers)
        
    }
    
    
    @objc func signOut() {
        NotificationCenter.default.post(name: NotificationManager.shared.getRegisterNotificationName(), object: nil, userInfo: ["name":"Ashish"])
        self.navigationController?.popViewController(animated: true)
    }
    

    @IBAction func goToChatAction(_ sender: UIButton) {
        // Go to Conversation
        let chatVC = storyboard?.instantiateViewController(withIdentifier: String(describing: ChatVC.self)) as! ChatVC
        
        self.navigationController?.pushViewController(chatVC, animated: true)
    }

}

// singleton
class NotificationManager {
    static let shared = NotificationManager()
    
    private init() { }
    
    func getRegisterNotificationName() -> Notification.Name {
        return Notification.Name("register_success")
    }
    
    
}
