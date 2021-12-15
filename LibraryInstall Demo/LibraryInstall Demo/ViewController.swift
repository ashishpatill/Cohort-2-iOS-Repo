//
//  ViewController.swift
//  LibraryInstall Demo
//
//  Created by Ashish Pisey on 15/12/21.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let url = URL(string: "https://media.istockphoto.com/vectors/donut-isolated-on-a-white-background-cute-colorful-and-glossy-donuts-vector-id1138438220?k=20&m=1138438220&s=612x612&w=0&h=b56x3agLh7L_mwwWQkoqCOf-zTybcP2S9PFTp75e4mg=")
        imgView.kf.setImage(with: url)
        
    }
    
    


}

