//
//  ViewController.swift
//  ErrorHandling Demo
//
//  Created by Ashish Pisey on 14/12/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
    }

    @IBAction func throwError(_ sender: UIButton) {
        do {
            try someFunction()
        } catch {
            if let customError = error as? PaymentError {
                print(customError.title)
                print(customError.message)
                
                self.showAlert(title: customError.title, message: customError.message)
            }
        }
    }
    
    func showAlert(title:String, message:String) {
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .actionSheet)
        let okAction = UIAlertAction.init(title: "OK", style: .cancel) { action in
            print("OK is clicked")
        }
        alert.addAction(okAction)
        
        let printAction = UIAlertAction.init(title: "Print", style: .default) { action in
            print("Print is clicked")
        }
        alert.addAction(printAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func someFunction() throws {
        let error = PaymentError(title: "Payment error", message: "Your bank server did not respond")
        
        throw error
    }

}

struct PaymentError : Error {
    let title: String
    let message: String
}

struct ServerError : Error {
    let status: Bool
    let message: String
}

