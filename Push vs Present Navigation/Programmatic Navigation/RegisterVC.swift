//
//  SecondVC.swift
//  Programmatic Navigation
//
//  Created by Ashish Pisey on 11/01/22.
//

import UIKit

class RegisterVC: UIViewController {
    weak var delegate: registerDelegate?
    var id: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(self.navigationController?.viewControllers)
        // Do any additional setup after loading the view.
        //let addButton = UIBarButtonItem.init(title: "Add", style: .plain, target: self, action: #selector(addAction))
//        let addButton = UIBarButtonItem.init(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(Register))
//        self.navigationItem.setRightBarButton(addButton, animated: false)
//        print("we are in register VC now")
       
        
    }
    
    @IBAction func Register() {
        print("add action clicked")
        // go to conversation screen
        let conversationVC = storyboard?.instantiateViewController(withIdentifier: String(describing: ConversationVC.self)) as! ConversationVC
        self.delegate?.registerSuccess(userId: "pqr12345")
        self.dismiss(animated: false, completion: nil)
    }
    

    

}
