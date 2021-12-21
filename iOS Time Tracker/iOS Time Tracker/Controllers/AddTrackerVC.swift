//
//  AddTrackerVC.swift
//  iOS Time Tracker
//
//  Created by Ashish Pisey on 21/12/21.
//

import UIKit

protocol TrackerDelegate: NSObjectProtocol {
    func addTrackerToList(tracker: Tracker)
    func removeTrackerfromList(tracker: Tracker)
}

class AddTrackerVC: UIViewController {

    @IBOutlet weak var tfTopicName: UITextField!
    
    @IBOutlet weak var pickerTime: UIPickerView!
    
    @IBOutlet weak var btnAddTracker: UIButton!
    let timeValues = ["5 min", "15 min", "30 min", "1 hour", "5 hours"]
    
    weak var delegate: TrackerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupPicker()
        tfTopicName.enablesReturnKeyAutomatically = true
        tfTopicName.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(shiftViewUp), name: AddTrackerVC.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(shiftViewDown), name: AddTrackerVC.keyboardWillHideNotification, object: nil)
    }
    
    @objc func shiftViewUp() {
        self.view.frame = CGRect.init(x: 0, y: -100, width: self.view.frame.width, height: self.view.frame.height)
    }
    
    @objc func shiftViewDown() {
        self.view.frame = CGRect.init(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
    }
    
    func setupPicker() {
        pickerTime.dataSource = self
        pickerTime.delegate = self
    }
    
    @IBAction func addTracker(_ sender: UIButton) {
        guard let topicName = tfTopicName.text else {
            return
        }
        
        let selectedPickerIndex = pickerTime.selectedRow(inComponent: 0)
        let displayValue = timeValues[selectedPickerIndex]
        let timeInterval = getTimerValue(pickerValue: displayValue)
        let tracker = Tracker.init(topicName: topicName, timeInterval: timeInterval, timerDisplayValue: displayValue)
        
        delegate?.addTrackerToList(tracker: tracker)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func getTimerValue(pickerValue: String) -> Int {
        var timeInterval = 0
        
        switch pickerValue {
        case timeValues[0]:
            timeInterval = 5 * 60
        case timeValues[1]:
            timeInterval = 15 * 60
        case timeValues[2]:
            timeInterval = 30 * 60
        case timeValues[3]:
            timeInterval = 3600
        case timeValues[4]:
            timeInterval = 5 * 3600
        default:
            timeInterval = 0
        }
        
        return timeInterval
    }

}

extension AddTrackerVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension AddTrackerVC: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return timeValues.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return timeValues[row]
    }
}
