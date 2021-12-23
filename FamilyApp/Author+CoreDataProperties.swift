//
//  Author+CoreDataProperties.swift
//  FamilyApp
//
//  Created by Ashish Pisey on 23/12/21.
//
//

import Foundation
import CoreData


extension Author {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Author> {
        return NSFetchRequest<Author>(entityName: "Author")
    }

    @NSManaged public var authorName: String?
    @NSManaged public var book: NSSet?

}

// MARK: Generated accessors for book
extension Author {

    @objc(addBookObject:)
    @NSManaged public func addToBook(_ value: Book)

    @objc(removeBookObject:)
    @NSManaged public func removeFromBook(_ value: Book)

    @objc(addBook:)
    @NSManaged public func addToBook(_ values: NSSet)

    @objc(removeBook:)
    @NSManaged public func removeFromBook(_ values: NSSet)

}

extension Author : Identifiable {

}
