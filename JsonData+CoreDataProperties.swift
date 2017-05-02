//
//  JsonData+CoreDataProperties.swift
//  TableViewCellSwift
//
//  Created by anki on 4/21/17.
//  Copyright © 2017 IOS. All rights reserved.
//

import Foundation
import CoreData


extension JsonData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<JsonData> {
        return NSFetchRequest<JsonData>(entityName: "JsonData");
    }

    @NSManaged public var name: String?
    @NSManaged public var capital: String?

}
