//
//  Users+CoreDataProperties.swift
//  TableViewCellSwift
//
//  Created by apple on 18/04/17.
//  Copyright © 2017 IOS. All rights reserved.
//

import Foundation
import CoreData


extension Users {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Users> {
        return NSFetchRequest<Users>(entityName: "Users");
    }

    @NSManaged public var age: Int64
    @NSManaged public var name: String?

}
