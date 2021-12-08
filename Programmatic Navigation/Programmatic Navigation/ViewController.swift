//
//  ViewController.swift
//  Programmatic Navigation
//
//  Created by Ashish Pisey on 08/12/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "First screen"
    }

    @IBAction func GoToDetail(_ sender: UIButton) {
        // push navigation
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondScreen") as! DetailVC
        detailVC.name = "Ashish"
        self.navigationController?.pushViewController(detailVC, animated: true)
        
        // modal navigation
        //self.present(detailVC, animated: true, completion: nil)
    }
    
}

