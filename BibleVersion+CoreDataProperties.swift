//
//  BibleVersion+CoreDataProperties.swift
//  Praise Path
//
//  Created by Daniel Efrain Ocasio on 6/3/24.
//
//

import Foundation
import CoreData


extension BibleVersion {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BibleVersion> {
        return NSFetchRequest<BibleVersion>(entityName: "BibleVersion")
    }

    @NSManaged public var name: String?
    @NSManaged public var abbreviation: String?
    @NSManaged public var id: String?
    @NSManaged public var isSelected: Bool

}

extension BibleVersion : Identifiable {

}
