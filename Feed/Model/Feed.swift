//
//  Feed.swift
//  Feed
//
//    The MIT License (MIT)
//
//    Copyright (c) 2015 David C. Vallas (david_vallas@yahoo.com) (dcvallas@twitter)
//
//    Permission is hereby granted, free of charge, to any person obtaining a copy
//    of this software and associated documentation files (the "Software"), to deal
//    in the Software without restriction, including without limitation the rights
//    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//    copies of the Software, and to permit persons to whom the Software is
//    furnished to do so, subject to the following conditions:
//
//    The above copyright notice and this permission notice shall be included in all
//    copies or substantial portions of the Software.
//
//    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE

import Foundation
import CoreData
import UIKit

class Feed {
    
    // We Assume Error Checking is done before this point, You may add Error Checking to Getter to be safer
    class var persistence: Persistence { get { return  (UIApplication.sharedApplication().delegate as! AppDelegate).persistence! } }
    class var moc: NSManagedObjectContext { get { return (UIApplication.sharedApplication().delegate as! AppDelegate).persistence!.moc! } }
    
    class func load() {
        
        // Assign so that we only call to UIApplication delegate once
        let moc = self.moc
        
        // We are Deleting Book Store Each Initialization For Testing Purposes (eventually will add seeding capabilities)
        Feed.deleteFeed()
        
        // Add Books
        var post1 = NSEntityDescription.insertNewObjectForEntityForName(Post.typeName, inManagedObjectContext:moc) as! Post
        post1.id = "ASDFASDGADSGAS"
        post1.text = "Hey buddy!!!, this is my first post #suckit"
        
        var post2 = NSEntityDescription.insertNewObjectForEntityForName(Post.typeName, inManagedObjectContext:moc) as! Post
        post2.id = "BASDFKSKADFKASDFH"
        post2.text = "I'm not your buddy, guy... #southpark"
        
        var post3 = NSEntityDescription.insertNewObjectForEntityForName(Post.typeName, inManagedObjectContext:moc) as! Post
        post3.id = "ASDFKASDGIADSFK"
        post3.text = "I'm not your guy, friend!!!  I'm a straight thug... #southpark #thuglife"
        
        // Add Post Categories
        var cat1 = NSEntityDescription.insertNewObjectForEntityForName(PostCategory.typeName, inManagedObjectContext:moc) as! PostCategory
        cat1.name = "suckit"
        
        var cat2 = NSEntityDescription.insertNewObjectForEntityForName(PostCategory.typeName, inManagedObjectContext:moc) as! PostCategory
        cat2.name = "southpark"
        
        var cat3 = NSEntityDescription.insertNewObjectForEntityForName(PostCategory.typeName, inManagedObjectContext:moc) as! PostCategory
        cat3.name = "thuglife"
        
        // Add SuckIt Relations
        var catRelation = cat1.mutableSetValueForKeyPath(PostCategory.typeKey.Posts)
        catRelation.addObject(post1)
        
        // Add SouthPark Relations
        catRelation = cat2.mutableSetValueForKeyPath(PostCategory.typeKey.Posts)
        catRelation.addObject(post2)
        catRelation.addObject(post3)
        
        // Add ThugLife Relation
        catRelation = cat3.mutableSetValueForKeyPath(PostCategory.typeKey.Posts)
        catRelation.addObject(post3)
        
        // Save Context
        persistence.saveContext()
    }
    
    class func deleteFeed() {
        deleteAllObjects(Post.typeName)
        deleteAllObjects(PostCategory.typeName)
    }
    
    class func deleteAllObjects(entityName: String) {
        let moc = self.moc
        var fetchRequest = NSFetchRequest(entityName: entityName)
        // We are using .ManagedObjectIDResultType since we don't need the entire
        // object to delete it, this is an optimization that reduces memory usage
        // for large fetches
        fetchRequest.resultType = .ManagedObjectIDResultType
        let objectIDs = moc.executeFetchRequest(fetchRequest, error: nil) as! [NSManagedObjectID]
        for objectID in objectIDs { moc.objectWithID(objectID) }
        persistence.saveContext()
    }
    
    class func fetchAllObjects(entityName: String) -> [AnyObject]? {
        let moc = self.moc
        let fetchRequest = NSFetchRequest(entityName: entityName)
        return moc.executeFetchRequest(fetchRequest, error: nil)
    }
    
    class func fetchAnyObject(entityName: String) -> AnyObject? {
        let objects = Feed.fetchAllObjects(entityName)
        return objects?.last
    }
}

extension Feed: TypePrintable {
    

    class var typeName: String {
        
        get { return "Feed" }
        
    }
    
    class var typeDescription: String {
        get {
            var d: String = self.typeName + " ****\n"
            d = d + Post.typeDescription
            d = d + PostCategory.typeDescription
            return d
        }
    }
    
    class var typeDetailDescription: String {
        get {
            var dd: String = self.typeName + " Detail ****\n"
            dd = dd + Post.typeDetailDescription + "\n"
            dd = dd + PostCategory.typeDetailDescription
            return dd
        }
    }
}
