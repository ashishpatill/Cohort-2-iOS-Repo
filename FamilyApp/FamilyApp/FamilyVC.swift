//
//  ViewController.swift
//  FamilyApp
//
//  Created by Ashish Pisey on 23/12/21.
//

import UIKit
import CoreData

class FamilyVC: UIViewController {

    @IBOutlet weak var tblAuthor: UITableView!
    var authorArr:[Author] = []
    @IBOutlet weak var tfAuthorName: UITextField!
    @IBOutlet weak var tfBookName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tblAuthor.dataSource = self
        tblAuthor.delegate = self
        
        fetchAuthors()
    }
    
    func getContext() -> NSManagedObjectContext {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        return delegate.persistentContainer.viewContext
    }

    @IBAction func addBook(_ sender: UIBarButtonItem) {
        let context = getContext()
        
        let book1 = Book(context: context)
        book1.name = "Book 1"
        
        let book2 = Book(context: context)
        book2.name = "Book 2"
        
        let book3 = Book(context: context)
        book3.name = "Book 3"
        
        let author = Author(context: context)
        author.authorName = "Author 1"
        author.addToBook(book1) // this method is in author class and takes Book object
        author.addToBook([book2, book3]) // this method is also in author class and takes NSSet i.e multiple books
        
        do {
            try context.save()
            fetchAuthors()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func fetchAuthors() {
        let context = getContext()
        
        let request = NSFetchRequest<Author>.init(entityName: "Author")
        
        do {
            authorArr = try context.fetch(request)
            tblAuthor.reloadData()
        } catch {
            print(error.localizedDescription)
        }
    }
}

extension FamilyVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return authorArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FamilyCell", for: indexPath)
        let author = authorArr[indexPath.row]
        cell.textLabel?.text = author.authorName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let personListVC = storyboard?.instantiateViewController(withIdentifier: "PersonListVC") as! BookListVC
        personListVC.author = authorArr[indexPath.row]
        self.navigationController?.pushViewController(personListVC, animated: true)
    }
}

