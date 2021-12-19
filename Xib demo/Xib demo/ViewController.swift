//
//  ViewController.swift
//  Xib demo
//
//  Created by Ashish Pisey on 16/12/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    @IBAction func nextAction(_ sender: UIButton) {
        let secondVC = SecondViewController.init(nibName: "SecondViewController", bundle: nil)
        self.navigationController?.pushViewController(secondVC, animated: true)
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
