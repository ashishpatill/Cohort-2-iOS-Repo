//
//  TopicsViewController.swift
//  MyTimeVisualizer
//
//  Created by admin on 19/12/2021.
//

import UIKit
import Charts

class TopicsViewController: UIViewController {

    var TopicDelegate: TopicDelegate?
    var indexPath: NSIndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
           swipeLeft.direction = .left
           self.view.addGestureRecognizer(swipeLeft)
    }
    


    @IBAction func TopicButtonPressed(_ sender: UIButton) {
        
        guard let indexPath = self.indexPath else { return }
        switch sender.tag {
        case 1:
            TopicDelegate?.TopicPressed(Topic: "ios", indexPath: indexPath)
        case 2:
            TopicDelegate?.TopicPressed(Topic: "swift", indexPath: indexPath)
        case 3:
            TopicDelegate?.TopicPressed(Topic: "algorithms", indexPath: indexPath)
        case 4:
            TopicDelegate?.TopicPressed(Topic: "data structures", indexPath: indexPath)
        case 5:
            TopicDelegate?.TopicPressed(Topic: "uikit", indexPath: indexPath)
        case 6:
            TopicDelegate?.TopicPressed(Topic: "swift ui", indexPath: indexPath)
        default:
            print("something went wrong")
        }
        dismiss(animated: true, completion: nil)
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {

        if let swipeGesture = gesture as? UISwipeGestureRecognizer {

            switch swipeGesture.direction {
                
            case .left:
                print("Swiped left")
                dismiss(animated: true, completion: nil)
                
            default:
                break
            }
        }
    }
}
