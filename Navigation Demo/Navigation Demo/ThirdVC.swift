//
//  ThirdVC.swift
//  Navigation Demo
//
//  Created by Ashish Pisey on 08/12/21.
//

import UIKit

class ThirdVC: UIViewController {
    var age: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("Received age: \(age)")
        print(self.navigationController?.viewControllers)

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
