//
//  Post.swift
//  Feed
//
//  Created by David Vallas on 5/18/15.
//  Copyright (c) 2015 Phoenix Labs. All rights reserved.
//

import Foundation
import CoreData

class Post: NSManagedObject {

    @NSManaged var id: String
    @NSManaged var text: String
    @NSManaged var categories: NSSet

}
