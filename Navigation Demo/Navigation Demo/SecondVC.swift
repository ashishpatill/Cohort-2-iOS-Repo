//
//  SecondVC.swift
//  Navigation Demo
//
//  Created by Ashish Pisey on 08/12/21.
//

import UIKit

class SecondVC: UIViewController {
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let name = name {
            print("Received name: \(name)")
        }
        
        print(self.navigationController!.viewControllers)
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
