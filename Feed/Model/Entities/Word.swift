//
//  Word.swift
//  Feed
//
//  Created by David Vallas on 5/23/15.
//  Copyright (c) 2015 Phoenix Labs. All rights reserved.
//

import Foundation
import CoreData

class Word: NSManagedObject {

    @NSManaged var length: Int16
    @NSManaged var text: String
    @NSManaged var wordCategory: WordCategory

}
