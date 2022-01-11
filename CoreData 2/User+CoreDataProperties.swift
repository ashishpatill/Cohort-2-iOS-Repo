//
//  User+CoreDataProperties.swift
//  CoreData 2
//
//  Created by Ashish Pisey on 28/12/21.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var email: String?

}

extension User : Identifiable {

}
