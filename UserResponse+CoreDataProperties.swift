//
//  UserResponse+CoreDataProperties.swift
//  TableViewCoreData
//
//  Created by Nathaniel Whittington on 12/8/21.
//
//

import Foundation
import CoreData


extension UserResponse {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserResponse> {
        return NSFetchRequest<UserResponse>(entityName: "UserResponse")
    }

    @NSManaged public var yesResponse: String?
    @NSManaged public var dateResponse: Date?

}

extension UserResponse : Identifiable {

}
