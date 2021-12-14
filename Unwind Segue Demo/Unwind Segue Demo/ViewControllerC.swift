//
//  ViewControllerC.swift
//  Unwind Segue Demo
//
//  Created by Ashish Pisey on 14/12/21.
//

import UIKit

class ViewControllerC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "unwindFromCToA" {
            // we are navigating back to A
            let vcA = segue.destination as! ViewControllerA
            vcA.textArr = ["text1", "text2", "text3", "text4"]
        } else if segue.identifier == "unwindFromCToB" {
            let vcB = segue.destination as! ViewControllerB
            vcB.name = "Ashish"
        }
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
