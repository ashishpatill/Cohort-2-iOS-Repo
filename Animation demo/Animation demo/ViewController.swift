//
//  ViewController.swift
//  Animation demo
//
//  Created by Ashish Pisey on 22/12/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redView: UIView!
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        hideView()
    }
    
    func hideView() {
        UIView.animate(withDuration: 5.0, delay: 0, options: .curveEaseIn) {
            // background thread
            //self.redView.alpha = 0
            self.topConstraint.constant = 500
            self.view.layoutIfNeeded()
        } completion: { isCompleted in
            print("animation completed")
            DispatchQueue.main.async {
                // ui operation
            }
        }
    }
    


}

