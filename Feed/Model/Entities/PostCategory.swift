//
//  PostCategory.swift
//  Feed
//
//  Created by David Vallas on 5/18/15.
//  Copyright (c) 2015 Phoenix Labs. All rights reserved.
//

import Foundation
import CoreData

class PostCategory: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var posts: NSSet

}
