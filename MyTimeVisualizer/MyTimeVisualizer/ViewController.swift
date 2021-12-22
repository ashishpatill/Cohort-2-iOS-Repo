//
//  ViewController.swift
//  MyTimeVisualizer
//
//  Created by admin on 19/12/2021.
//

import UIKit

var weekDataArr = [String: Any]()
var times = [String]()
var tasks = [String]()

var tableViewDataArr =  [[String: String]]()

let myTask = ["Study IOS", "Solve Assignments", "Study Data Structure"]
class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITableViewDataSource, UITableViewDelegate,SaveItemDelegate {
    
    func saveItemText(item: String, row:Int) {
        print("My Note is: \(item) atIndex: \(row)")

        tableViewDataArr[row]["task"] = item
        let dayName = days[pickerViewCurrentIndex]
        weekDataArr[dayName] = tableViewDataArr
    }
    
    @IBOutlet weak var TasksTable: UITableView!
    @IBOutlet weak var dayPicker: UIPickerView!
    
    let days = ["Sunday","Monday","Tuseday","Wednesday","Thursday","Friday","Saturday"]
        
    var hour = 12
    var minutes = 0
    var mode = ""
    var minutesSpan = "00"
    
    var pickerViewCurrentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // swipe gester recognizer (left || right)
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
           swipeRight.direction = .right
           self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
           swipeRight.direction = .left
           self.view.addGestureRecognizer(swipeLeft)
                
        TasksTable.dataSource = self
        TasksTable.delegate = self
        
        dayPicker.dataSource = self
        dayPicker.delegate = self
        
        // auto select the day in picker based on the current day
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        let dayInWeek = dateFormatter.string(from: date)
        print("dayInWeek: \(dayInWeek)")
        
        for i in 0..<days.count{
            if days[i] == dayInWeek{
                dayPicker.selectRow(i, inComponent: 0, animated: true)
                pickerViewCurrentIndex = i
            }
        }
        
        getCurrentTime()

    }

    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {

        if let swipeGesture = gesture as? UISwipeGestureRecognizer {

            switch swipeGesture.direction {
            case .right:
                print("Swiped right")
                performSegue(withIdentifier: "swapLeftSegue", sender: self)
            case .left:
                print("Swiped left")
                performSegue(withIdentifier: "chartSegue", sender: self)
                
            default:
                break
            }
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return days.count
    }
    
    // Capture the picker view selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
        print("selected row#: \(row)")
        
        pickerViewCurrentIndex = row
        times.removeAll()
        tasks.removeAll()
        getCurrentTime()
    }

    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        //Styling string element before display
        let day = NSAttributedString(string: days[row], attributes: [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont(descriptor: UIFontDescriptor.preferredFontDescriptor(withTextStyle: .largeTitle), size: 28),
        ])
        return day
    }
    
    func getCurrentTime(){
        
        let date = Date()
        let calendar = Calendar.current
        
        hour = calendar.component(.hour, from: date)
        minutes = calendar.component(.minute, from: date)
        
        hour = 10
        
        if hour > 12 {
            hour -= 12
            mode = "PM"
        }else{
            mode = "AM"
        }
        
        TimeItems()
    }
    
    func TimeItems(){
        var time = ""
        while hour < 12 {
            time = "\(hour):\(minutesSpan) \(mode) "
            checkTimeDifference()
            times.append(time)
            tasks.append("")
        }
        
        if mode == "AM"{
            mode = "PM"
            time = "\(hour):00 \(mode) "
            times.append(time)
            tasks.append("")
            time = "\(hour):30 \(mode) "
            times.append(time)
            tasks.append("")
            minutesSpan = "00"
            hour = 1
            TimeItems()
        }else{
            mode = "AM"
            time = "\(hour):00 \(mode) "
            times.append(time)
            tasks.append("")
        }
        
        var tempArray = [[String: String]]()
        
        let dayName = days[pickerViewCurrentIndex]
        if weekDataArr.count > 0 {
            let keyExists = weekDataArr[dayName] != nil
            if !keyExists {
                for i in 0..<times.count {
                    let dataDict = ["time":times[i], "task":tasks[i]]
                    tempArray.append(dataDict)
                }
                weekDataArr[dayName] = tempArray
            }
            else {

            }
        }
        else {
            for i in 0..<times.count {
                let dataDict = ["time":times[i], "task":tasks[i]]
                tempArray.append(dataDict)
            }
            weekDataArr[dayName] = tempArray
        }

        print("weekDataArr: \(weekDataArr)")

        tableViewDataArr.removeAll()
        tableViewDataArr = weekDataArr[dayName] as! [[String: String]]
        TasksTable.reloadData()
        
    }
    
    func checkTimeDifference(){
        if minutesSpan == "00" {
            minutesSpan = "30"
        }else{
            hour += 1
            minutesSpan = "00"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewDataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! CustomTableViewCell
        
//        if (indexPath.row  == 0){
//            cell.layer.masksToBounds = true
//            cell.layer.cornerRadius = 5
//            cell.layer.borderWidth = 2
//            cell.layer.shadowOffset = CGSize(width: -1, height: 1)
//            cell.layer.borderColor = UIColor.yellow.cgColor
//        }
//        else {
//            cell.layer.masksToBounds = false
//            cell.layer.cornerRadius = 0
//            cell.layer.borderWidth = 0
//        }
        
        cell.delegate = self

        let timeString = tableViewDataArr[indexPath.row]["time"]!
        let taskString = tableViewDataArr[indexPath.row]["task"]!
        
        cell.timeLabel.text = timeString
        if !taskString.isEmpty{
            cell.noteTextFeild.text = taskString
        }
        
        cell.noteTextFeild.tag = indexPath.row
        
        return cell
    }
    
    @IBAction func plusButtonPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Start New Week?", message: "Choose To Start a new week and remove data from previous one ?" , preferredStyle: UIAlertController.Style.alert)
        // add an action (button)
        alert.addAction(UIAlertAction(title: "Add Keyowrd", style: UIAlertAction.Style.default, handler: {action in self.performSegue(withIdentifier: "swapLeftSegue", sender: self)
        }))
        
        alert.addAction(UIAlertAction(title: "Go Back", style: UIAlertAction.Style.cancel, handler: nil))
        
        alert.addAction(UIAlertAction(title: "Add New Week", style: UIAlertAction.Style.destructive, handler: {action in
            
            self.loadView()
            self.viewDidLoad()}))
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
}

