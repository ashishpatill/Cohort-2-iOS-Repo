//
//  PersonListVC.swift
//  FamilyApp
//
//  Created by Ashish Pisey on 23/12/21.
//

import UIKit
import CoreData

class BookListVC: UIViewController {

    @IBOutlet weak var tblBookList: UITableView!
    //var books:[Book] = []
    var author:Author?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tblBookList.dataSource = self
        
        tblBookList.reloadData()
    }
}

extension BookListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let booksArr = author?.book {
            return booksArr.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath)
        if let bookArr = author?.book?.allObjects as? [Book] {
            let bookObj = bookArr[indexPath.row]
            cell.textLabel?.text = bookObj.name
        }
        return cell
    }
}
