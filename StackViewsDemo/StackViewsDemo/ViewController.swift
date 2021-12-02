//
//  ViewController.swift
//  StackViewsDemo
//
//  Created by Ashish Pisey on 02/12/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var gameButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }
    
    func setupUI() {
        for aBtn in gameButtons {
            aBtn.layer.cornerRadius = 10
            aBtn.layer.masksToBounds = true
            
            aBtn.layer.borderColor = UIColor.gray.cgColor
            aBtn.layer.borderWidth = 1
        }
    }

    @IBAction func gameAction(_ sender: UIButton) {
        print("My tag is : \(sender.tag)")
    }
    
}

