//
//  ViewControllerB.swift
//  Unwind Segue Demo
//
//  Created by Ashish Pisey on 14/12/21.
//

import UIKit

class ViewControllerB: UIViewController {
    var name:String?
    
    @IBOutlet weak var tf1: UITextField!
    @IBOutlet weak var tf4: UITextField!
    @IBOutlet weak var tf3: UITextField!
    @IBOutlet weak var tf2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        print("View did load B")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("View will appear B")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "unwindSegueBId" {
            // we are navigating back to A
            let vcA = segue.destination as! ViewControllerA
            guard let text1 = tf1.text,
                  let text2 = tf2.text,
                  let text3 = tf3.text,
                  let text4 = tf4.text else {
                      return
                  }
            vcA.textArr = [text1, text2, text3, text4]
        } else if segue.identifier == "fromBToC" {
            // send data to C
            
        }
    }
    
    @IBAction func goBackToB(_ seg : UIStoryboardSegue) {
        print("navigating back to B")
        if seg.identifier == "unwindFromCToB" {
            print(name!)
        }
    }
    
    @IBAction func goTOViewControllerC(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToCId", sender: nil)
    }
}
