//
//  ViewController.swift
//  Tipster
//
//  Created by Pulkit Goyal on 14/12/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var inputLabel: UILabel!
    
    @IBOutlet weak var minTipPercent: UILabel!
    @IBOutlet weak var medTipPercent: UILabel!
    @IBOutlet weak var maxTipPercent: UILabel!
    
    @IBOutlet weak var minTip: UILabel!
    @IBOutlet weak var MedTip: UILabel!
    @IBOutlet weak var maxTip: UILabel!
    
    @IBOutlet weak var minEach: UILabel!
    @IBOutlet weak var medEach: UILabel!
    @IBOutlet weak var maxEach: UILabel!
    
    @IBOutlet weak var groupSizeLbl: UILabel!
    
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var groupSlider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        inputLabel.text = "0"
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        print("sender.tag: \(sender.tag)")
        
        if sender.tag < 10 && inputLabel.text == "0" {
            inputLabel.text = String(sender.tag)
        }
        else if sender.tag < 10 {
            if let inputText = inputLabel.text {
                inputLabel.text = inputText + String(sender.tag)
            }
        }
        else if sender.tag == 11 { // .
            if let inputText = inputLabel.text {
                if inputText.contains(".") {
                }
                else {
                    inputLabel.text = inputText + "."
                }
            }
        }
        else if sender.tag == 10 { // C
            inputLabel.text = "0"
        }
        performCalculation()
    }
    
    @IBAction func tipSliderValueChanged(_ sender: UISlider) {
        minTipPercent.text = String(round(tipSlider.value)) + "%"
        medTipPercent.text = String(round(tipSlider.value) + 5) + "%"
        maxTipPercent.text = String(round(tipSlider.value) + 10) + "%"
        performCalculation()
    }
    
    @IBAction func groupSliderValueChanged(_ sender: Any) {
        groupSizeLbl.text = "Group Size: \(String(Int(round(groupSlider.value))))"
        performCalculation()
    }
    
    func performCalculation() {
        if let inputText = inputLabel.text {
            
            let input = Double(inputText)!
            let tip = Double(round(tipSlider.value))
            let group = Double(round(groupSlider.value))
            
            let minimumTip = round(input * (tip/100))
            let minimumEach = (input + minimumTip)/group
                        
            let mediumTip = round(input * ((tip + 5)/100))
            let mediumEach = (input + mediumTip)/group
                        
            let maximumTip = round(input * ((tip + 10)/100))
            let maximumEach = (input + maximumTip)/group
            
            minTip.text = String(minimumTip)
            MedTip.text = String(mediumTip)
            maxTip.text = String(maximumTip)

            minEach.text = String(minimumEach)
            medEach.text = String(mediumEach)
            maxEach.text = String(maximumEach)
            
        }
    }
    
}

