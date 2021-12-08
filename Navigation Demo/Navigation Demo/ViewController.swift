//
//  ViewController.swift
//  Navigation Demo
//
//  Created by Ashish Pisey on 08/12/21.
//

import UIKit

class ViewController: UIViewController {
    var username = "Ashish"
    var age = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSegueId" {
            let secondVC = segue.destination as! SecondVC
            secondVC.name = username
        } else if segue.identifier == "showDetailSegueID" {
            let thirdVC = segue.destination as! ThirdVC
            thirdVC.age = age
        }
    }
    
    @IBAction func goToNextScreen(_ sender: UIButton) {
        username = "Ahmed"
        self.performSegue(withIdentifier: "showSegueId", sender: nil) //navigation stack
    }
    
    @IBAction func goToThirdScreen(_ sender: UIButton) {
        age = 9
        self.performSegue(withIdentifier: "showDetailSegueID", sender: nil) // not using navigation controller (Modal presentation)
    }
}

