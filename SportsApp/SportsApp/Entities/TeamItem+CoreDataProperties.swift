//
//  TeamItem+CoreDataProperties.swift
//  SportsApp
//
//  Created by Ashish Pisey on 30/12/21.
//
//

import Foundation
import CoreData


extension TeamItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TeamItem> {
        return NSFetchRequest<TeamItem>(entityName: "TeamItem")
    }

    @NSManaged public var icon: Data?
    @NSManaged public var name: String?
    @NSManaged public var id: String
    @NSManaged public var player: NSSet?

}

// MARK: Generated accessors for player
extension TeamItem {

    @objc(addPlayerObject:)
    @NSManaged public func addToPlayer(_ value: PlayerItem)

    @objc(removePlayerObject:)
    @NSManaged public func removeFromPlayer(_ value: PlayerItem)

    @objc(addPlayer:)
    @NSManaged public func addToPlayer(_ values: NSSet)

    @objc(removePlayer:)
    @NSManaged public func removeFromPlayer(_ values: NSSet)

}

extension TeamItem : Identifiable {

}
