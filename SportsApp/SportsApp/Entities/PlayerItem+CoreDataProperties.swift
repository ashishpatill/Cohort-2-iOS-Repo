//
//  PlayerItem+CoreDataProperties.swift
//  SportsApp
//
//  Created by Ashish Pisey on 30/12/21.
//
//

import Foundation
import CoreData


extension PlayerItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PlayerItem> {
        return NSFetchRequest<PlayerItem>(entityName: "PlayerItem")
    }

    @NSManaged public var age: Int16
    @NSManaged public var height: Double
    @NSManaged public var name: String?
    @NSManaged public var id: String
    @NSManaged public var team: TeamItem?

}

extension PlayerItem : Identifiable {

}
