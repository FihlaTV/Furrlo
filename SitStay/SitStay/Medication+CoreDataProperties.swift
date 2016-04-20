//
//  Medication+CoreDataProperties.swift
//  SitStay
//
//  Created by Philip Gilbreth on 4/20/16.
//  Copyright © 2016 GroupA. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Medication {

    @NSManaged var amount: NSNumber?
    @NSManaged var complete: NSNumber?
    @NSManaged var instructions: String?
    @NSManaged var time: NSDate?
    @NSManaged var type: String?
    @NSManaged var petID: Pet?

}