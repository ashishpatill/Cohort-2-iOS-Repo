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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .systemCyan
        
        setupUI()
    }
    
    func setupUI() {
        view.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            nameLabel.heightAnchor.constraint(equalToConstant: 40)])
    }


}

