//
//  TopicDelegate.swift
//  MyTimeVisualizer
//
//  Created by admin on 19/12/2021.
//

import Foundation
import UIKit

protocol TopicDelegate: AnyObject {
    func TopicPressed(Topic: String, indexPath: NSIndexPath)
}
