//
//  ViewController.swift
//  Programmatic Navigation
//
//  Created by Ashish Pisey on 11/01/22.
//

import UIKit

protocol registerDelegate : NSObjectProtocol {
    func registerSuccess(userId:String)
}

class LoginVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addRegisterNotification()
    }
    
    func addRegisterNotification() {
        //let name = "Ashish"
        let notificationName  = Notification.Name("register_success")
        let _ = NotificationCenter.default.addObserver(self, selector: #selector(signoutSuccess(notification:)), name: notificationName, object: nil)
    }
    
    @objc func signoutSuccess(notification:Notification) {
        print(notification.userInfo?["name"])
        print("signout is successfull")
    }
    
//    override func viewDidDisappear(_ animated: Bool) {
//        NotificationCenter.default.removeObserver(self, name: NotificationManager.shared.getRegisterNotificationName(), object: nil)
//    }

    @IBAction func goToRegister(_ sender: UIButton) {
        let registerVC = storyboard?.instantiateViewController(withIdentifier: String(describing: RegisterVC.self)) as! RegisterVC
        registerVC.delegate = self
        // use present not push in registration to avoid coming back from conversation to register again
        registerVC.id = "abc123"
        self.present(registerVC, animated: true, completion: nil) // important
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        // Go to Conversation
        goToConversation()
    }
    
    func goToConversation() {
        DispatchQueue.main.async {
            let conversationVC = self.storyboard?.instantiateViewController(withIdentifier: String(describing: ConversationVC.self)) as! ConversationVC
        
            self.navigationController?.pushViewController(conversationVC, animated: true)
        }
    }
    
}

extension LoginVC: registerDelegate {
    func registerSuccess(userId:String) {
        print("Register is successfull \nuserId: \(userId)")
        goToConversation()
    }
}

