//
//  DetailVC.swift
//  Fifa Rankings
//
//  Created by Ashish Pisey on 05/12/21.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var teamLabel: UILabel!
    var teamName : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.teamLabel.text = teamName
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
