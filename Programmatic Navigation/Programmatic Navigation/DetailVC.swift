//
//  DetailVC.swift
//  Programmatic Navigation
//
//  Created by Ashish Pisey on 08/12/21.
//

import UIKit

class DetailVC: UIViewController {
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Received name: \(name!)")
        //print(self.navigationController!.viewControllers)
    }
    

    @IBAction func backAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

}
