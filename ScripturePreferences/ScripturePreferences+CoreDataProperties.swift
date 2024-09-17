//
//  ScripturePreferences+CoreDataProperties.swift
//  Praise Path
//
//  Created by Daniel Efrain Ocasio on 8/26/24.
//
//

import Foundation
import CoreData


extension ScripturePreferences {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ScripturePreferences> {
        return NSFetchRequest<ScripturePreferences>(entityName: "ScripturePreferences")
    }

    @NSManaged public var fontName: String
    @NSManaged public var fontSize: String
    @NSManaged public var lineHeight: String
    @NSManaged public var themeName: String

}

extension ScripturePreferences : Identifiable {

}
