//
//  AddItemVC.swift
//  TableVCDemo
//
//  Created by Ashish Pisey on 12/12/21.
//

import UIKit

struct Task {
    let id : String
    let name : String
    let status :  Bool
}

protocol AddItemDelegate: NSObjectProtocol {
    func sendTask(taskObj:Task)
}

class AddItemVC: UIViewController {
    var taskName: String?
    @IBOutlet weak var taskTextField: UITextField!
    weak var addItemDelegate: AddItemDelegate? // task list
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //print("task received: \(taskName!)")
    }
    

    @IBAction func addItemAction(_ sender: UIButton) {
        
        // pass task to task list screen
        if let task = self.taskTextField.text {
            let taskId = UUID().uuidString
            let taskObj = Task.init(id: taskId, name: task, status: false)
            print("Add item button pressed")
            addItemDelegate?.sendTask(taskObj: taskObj)
            self.navigationController?.popViewController(animated: true) // go back
        }
    }

}
