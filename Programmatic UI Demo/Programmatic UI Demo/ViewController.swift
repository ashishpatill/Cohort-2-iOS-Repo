//
//  ViewController.swift
//  Programmatic UI Demo
//
//  Created by Ashish Pisey on 16/12/21.
//

import UIKit

class ViewController: UIViewController {
    var label: UILabel?
    
    lazy var nameLabel:UILabel = {
        let label = UILabel()
        label.text = "Ashish"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Step 1:-
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .green
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false // Important
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        tableView.dataSource = self
        setupUI()
    }
    
    func setupUI() {
        // Step 2
        view.addSubview(tableView)
        
        // Step 3:
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }


}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell.init(style: .value1, reuseIdentifier: "MyCell")
        //cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = "some text"
        cell.detailTextLabel?.text = "right text"
        return cell
    }
}

