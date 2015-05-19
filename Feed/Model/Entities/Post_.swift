//
//  Post_.swift
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

extension Post: Printable {
    
    override var description: String { get { return " Post id: \(self.id), text: \(self.text)" } }
    
}

extension Post {
    
    override func awakeFromInsert() { println("***awakeFromInsert - New Post Created") }
    
    override func awakeFromFetch() { println("***awakeFromFetch - Post \(self.id) Fetched") }
    

}

extension Post: TypePrintable {
    
    class var typeName: String { get { return "Post" } }
    
    struct typeKey {
        static let Id = "id"
        static let Text = "text"
        static let Categories = "categories"
    }
    
    class var typeDescription: String {
        get {
            let moc = Feed.moc
            var d: String = ""
            let fetchRequest = NSFetchRequest(entityName:Post.typeName)
            var posts = moc.executeFetchRequest( fetchRequest, error: nil)
            d = "Posts - \(posts?.count) total \n"
            return d
        }
    }
    
    class var typeDetailDescription: String {
        get {
            let moc = Feed.moc
            var dd: String = ""
            let fetchRequest = NSFetchRequest(entityName:Post.typeName)
            var posts = moc.executeFetchRequest(fetchRequest, error: nil)
            dd = "Posts - \(posts?.count) total \n"
            for post in posts as! [Post] {
                dd = dd + post.description + "\n"
            }
            return dd
        }
    }
}