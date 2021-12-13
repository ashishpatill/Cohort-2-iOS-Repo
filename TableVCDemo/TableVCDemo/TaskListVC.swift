//
//  ItemList.swift
//  TableVCDemo
//
//  Created by Ashish Pisey on 12/12/21.
//

import UIKit
import CoreData

class TaskListVC: UITableViewController, AddItemDelegate {
    var itemList:[String] = []
    var taskItemArr:[TaskEntity] = []
    
    var headerTitleArr = ["Groceries", "Vegetables", "Cereals"]
    override func viewDidLoad() {
        super.viewDidLoad()

        getTask()
    }

    @IBAction func addAction(_ sender: UIBarButtonItem) {
        let addItemVC = storyboard?.instantiateViewController(withIdentifier: "ItemVCID") as! AddItemVC
        addItemVC.taskName = "Hello"
        addItemVC.addItemDelegate = self
        self.navigationController?.pushViewController(addItemVC, animated: true) // go to next screen
    }
    
    @IBAction func updateTask(_ sender: UIBarButtonItem) {
        updateTask(oldTaskName: "Buy milk", newTaskName: "Buy Cookies")
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headerTitleArr[section]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return taskItemArr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        let taskItem = taskItemArr[indexPath.row]
        cell.textLabel?.text = taskItem.name
        return cell
    }
    
    func sendTask(taskObj: Task) {
        print("received task in Task List VC")
        itemList.append(taskObj.name)
        saveTask(task: taskObj)
        getTask()
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction.init(style: .destructive, title: "Delete") { action, view, aClosure in
            let taskItem = self.taskItemArr[indexPath.row]
            guard let taskName = taskItem.name else { return }
            self.delete(taskName: taskName)
        }
        let swipeConfiguration = UISwipeActionsConfiguration.init(actions: [deleteAction])
        return swipeConfiguration
    }

}

extension TaskListVC {
    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext // snapshot of all app data stored in core data database
    }
    
    func saveTask(task: Task) {
        //1. get updated app context
        let context = getContext()
        
        //2. Creating NSManagedObject
        let taskItem = TaskEntity.init(context: context) // important
        taskItem.name = task.name
        taskItem.id = task.id
        
        //3. save context
        do {
            try context.save()
        } catch {
            // error handling
            print(error.localizedDescription)
        }
    }
    
    func getTask() {
        let context = getContext()
        
        let request = NSFetchRequest<TaskEntity>.init(entityName: "TaskEntity")
        
        do {
            taskItemArr = try context.fetch(request)
            tableView.reloadData()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func updateTask(oldTaskName:String, newTaskName: String) {
        let context = getContext()
                
        // update the task item array
        let request = NSFetchRequest<TaskEntity>.init(entityName: "TaskEntity")
        
        // query or filter
        let predicate = NSPredicate.init(format: "name = %@", oldTaskName)
        let predicate2 = NSPredicate.init(format: "name == %@", "")
        let compoundPredicate = NSCompoundPredicate.init(orPredicateWithSubpredicates: [predicate, predicate2])
        request.predicate = compoundPredicate
        do {
            if let taskItem = try context.fetch(request).first {
                taskItem.name = newTaskName
                try context.save()
                getTask()
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func delete(taskName:String) {
        let context = getContext()
                
        // update the task item array
        let request = NSFetchRequest<TaskEntity>.init(entityName: "TaskEntity")
        
        // query or filter
        let predicate = NSPredicate.init(format: "name = %@", taskName)
        request.predicate = predicate
        
        do {
            if let taskItem = try context.fetch(request).first {
                context.delete(taskItem)
                getTask()
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}

// NSManagedObject -> reference of the entity representing your data
// Persistent Store container -> It is like a box holding all the data, we dont interact directly with container
// NSManagedObjectContext -> This is like a snapshot / reference of the data in the container
// Entity -> Blueprint for nsmanagedObject

// Singleton - Design pattern
