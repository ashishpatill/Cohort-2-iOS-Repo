//
//  TaskEntity+CoreDataProperties.swift
//  TableVCDemo
//
//  Created by Ashish Pisey on 13/12/21.
//
//

import Foundation
import CoreData


extension TaskEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TaskEntity> {
        return NSFetchRequest<TaskEntity>(entityName: "TaskEntity")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?

}

extension TaskEntity : Identifiable {

}
