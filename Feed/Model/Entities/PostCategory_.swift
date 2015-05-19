//
//  PostCategory_.swift
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


extension PostCategory: Printable {
    
    override var description: String { get { return " PostCategory name: \(self.name)" } }
    
}

extension PostCategory: TypePrintable {
    
    class var typeName: String { get { return "PostCategory" } }
    
    struct typeKey {
        static let Name = "name"
        static let Posts = "posts"
    }
    
    class var typeDescription: String {
        get {
            let moc = Feed.moc
            var d: String = ""
            let fetchRequest = NSFetchRequest(entityName:PostCategory.typeName)
            var categories = moc.executeFetchRequest( fetchRequest, error: nil)
            d = "Post Categories - \(categories?.count) total \n"
            return d
        }
    }
    
    class var typeDetailDescription: String {
        get {
            let moc = Feed.moc
            var dd: String = ""
            let fetchRequest = NSFetchRequest(entityName:PostCategory.typeName)
            var categories = moc.executeFetchRequest( fetchRequest, error: nil)
            dd = "Post Categories - \(categories?.count) total \n"
            for category in categories as! [PostCategory] {
                dd = dd + category.description + "\n"
            }
            return dd
        }
    }
    
}