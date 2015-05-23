//
//  AppDelegate.swift
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

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var persistence: Persistence? = nil
    var observer: KVObserver? = nil
    
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        // Hold Persistence
        persistence = Persistence()
        
        
        
        return true
    }
    
    // TODO: THIS IS A DEMO SCRIPT, WE SHOULD REMOVE THIS OR MAKE A TEST LATER
    func demoFeed() {
        // Load Feed
        println( "DEMO: - awakeFromInsert/Fetch \n" )
        Feed.load()
        
        // Print TypeDescription
        println( "\nDEMO: Regular Description of Feed \n" )
        println( "\(Feed.typeDescription)")
        
        // Print Detailed Type Description
        println( "DEMO: Detailed Description of Feed \n" )
        println( "\(Feed.typeDetailDescription)")
        
        // DEMO: KVO - Retrieve a Random Post, Add Observer to Text, then Change Text
        println( "DEMO: KVO Observation \n" )
        if let post = Feed.fetchAnyObject(Post.typeName) as? Post {
            
            // Add an Observer to Post.text
            observer = KVObserver()
            observer?.observeKeyPath(Post.typeKey.Text , object: post)
            
            post.text = "This New Text Kicks Off a Key Value Observation"
            // TODO: We must remove the category too if one exists!!!
        }
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        persistence!.saveContext()
    }
}

