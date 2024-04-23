//
//  Ticket+CoreDataProperties.swift
//  Take Me Away
//
//  Created by Baris Akcay on 22.04.2024.
//
//

import Foundation
import CoreData


extension Ticket {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Ticket> {
        return NSFetchRequest<Ticket>(entityName: "Ticket")
    }

    @NSManaged public var name: String?
    @NSManaged public var surname: String?
    @NSManaged public var id: UUID?
    @NSManaged public var date: String?
    @NSManaged public var time: String?
    @NSManaged public var seat: Int16

}

extension Ticket : Identifiable {

}
