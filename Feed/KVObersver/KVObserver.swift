//
//  KVObserver.swift
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

class KVObserver: NSObject {
    
    // TODO: Add Observation Check (We need Entities to Message if they will be deleted)
    // TODO: We want Add and Remove Observer for Entities
    // TODO: We want functions with Observation Handler Blocks
    
    func observeKeyPath(keyPath: String, forEntityName entityName: String) {
        let fetchRequest = NSFetchRequest(entityName: entityName)
        let objects = Feed.moc.executeFetchRequest(fetchRequest, error: nil)
        let options : NSKeyValueObservingOptions = .New | .Old
        for object in objects as! [NSManagedObject] {
            object.addObserver(self, forKeyPath: keyPath, options: options, context: nil)
        }
    }
    
    func observeKeyPath(keyPath: String, object: NSObject) {
        let options : NSKeyValueObservingOptions = .New | .Old
        object.addObserver(self, forKeyPath: keyPath, options: options, context: nil)
    }
    
    override func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutablePointer<Void>) {
        println(" Observed value for \(keyPath): \( change[ NSKeyValueChangeOldKey]!) >>> \( change[ NSKeyValueChangeNewKey]!)")
    }
    
    deinit {
        // TODO: Clean up outstanding observations
    
    }
}