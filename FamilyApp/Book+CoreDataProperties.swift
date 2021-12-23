//
//  Book+CoreDataProperties.swift
//  FamilyApp
//
//  Created by Ashish Pisey on 23/12/21.
//
//

import Foundation
import CoreData


extension Book {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Book> {
        return NSFetchRequest<Book>(entityName: "Book")
    }

    @NSManaged public var name: String?
    @NSManaged public var author: Author?

}

extension Book : Identifiable {

}
