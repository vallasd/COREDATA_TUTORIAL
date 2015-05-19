# COREDATA_TUTORIAL 

This is a sample Core Data project in Swift.  It is used as a tutorial for iOS application development using Core Data.  It creates a Twitter like feed app.

## Code Example

Please check out the different branches in this project to follow the progression of building a Core Data Application in Swift

### FEED_1 - Covers Concepts Found in BOOK-TITLE: Chapter 1.
* Demos Basic Core Data Application setup
* Demos use of Key Values to update Entity Attributes without NSManagedObject Subclass (AppDelegate)
* Demos Persistence class which handles Store and MOC setup outside of AppDelegate (AppDelegate, Persistence)

### FEED_2 - Covers Concepts Found in BOOK-TITLE: Chapter 2.
* Demos NSManagedObject Subclassing (Post, PostCategory)
* Demos NSManagedObject Extensions (Post_, PostCategory_)
* Demos Adding, Deleting, Changing Entities (Feed, AppDelegate)
* Demos use of Structs for KeyPath retrieval for an NSManagedObject (Post_, PostCategory_ *TypePrintable)
* Demos protocol and class vars to Print EntityNames and Descriptions (Post_, Protocol *TypePrintable)
* Demos use of class vars to return ManagedObjectContexts (Feed)
* Demos awakeFromFetch / awakeFromInsert - (Post_)
* Demos Basic KVO principle, this will be expanded at a later time (KVObserver, AppDelegate) 

### FEED_3 - Covers Concepts Found in BOOK-TITLE: Chapter 3.
* TBD

## Motivation

Learning Core Data implementations with Swift.  This is a step along the way.

## Installation

TBD

## Tests

None.

## Contributors

David Vallas

## License

MIT
