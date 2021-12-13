//
//  ViewController.swift
//  Persistence Intro
//
//  Created by Ashish Pisey on 13/12/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var myTF: UITextField!
    let userKey = "username"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let savedText = getData(key: userKey) as? String {
            lbl.text = savedText
        }
    }

    @IBAction func Savedata(_ sender: UIButton) {
        if let myText = myTF.text
            {
            saveData(value: myText)
        }
        
        if let savedText = getData(key: userKey) as? String {
            lbl.text = savedText
        }
    }
    
    func saveData(value: String) {
        let preference = UserDefaults.standard
        
        preference.set(value, forKey: userKey)
    }
    
    func getData(key:String) -> String? {
        let preference = UserDefaults.standard
        
        return preference.value(forKey: userKey) as? String
    }
    
}

