//
//  ViewController.swift
//  Unwind Segue Demo
//
//  Created by Ashish Pisey on 14/12/21.
//

import UIKit

class ViewControllerA: UIViewController {
    var textArr: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("View did load A")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("View will appear A")
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    @IBAction func goBackToA(_ unwindSegue : UIStoryboardSegue) {
        if let vcB = unwindSegue.source as? ViewControllerB,
           let text1 = textArr?[0],
           let text2 = textArr?[1],
           let text3 = textArr?[2],
           let text4 = textArr?[3] {
            print("Coming from B")
            print("We are having a perfectly \(text1) right now. Later we will \(text2) and \(text3) in the \(text4)")
        }
        else if let vcC = unwindSegue.source as? ViewControllerC {
            print("Coming from C")
        }
    }


    @IBAction func goTOViewControllerB(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToBId", sender: nil)
    }
}

