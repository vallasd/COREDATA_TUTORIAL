//
//  WordCategory.swift
//  Feed
//
//  Created by David Vallas on 5/23/15.
//  Copyright (c) 2015 Phoenix Labs. All rights reserved.
//

import Foundation
import CoreData

class WordCategory: NSManagedObject {

    @NSManaged var firstLetter: String
    @NSManaged var words: NSSet

}
