//
//  PersistentController.swift
//  NoteAppUsingCoreData
//
//  Created by Uday Abhishek on 25/08/26.
//

import Foundation
import CoreData

class PersistentController {
    static let shared = PersistentController()
    
    let container: NSPersistentContainer
    
    private init() {
       container = NSPersistentContainer(name: "Notes")
        
        container.loadPersistentStores { _, error in
            if let error {
                fatalError(error.localizedDescription)
            }
        }
    }
    
    
}
