//
//  Extensions.swift
//  SportsApp
//
//  Created by Ashish Pisey on 29/12/21.
//

import Foundation
import UIKit

extension UIViewController {
    func showError(error:Error) {
        let alertVC = UIAlertController.init(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
}

extension UIImage {
    func imageResized(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
