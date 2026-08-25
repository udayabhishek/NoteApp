//
//  NoteAppUsingCoreDataApp.swift
//  NoteAppUsingCoreData
//
//  Created by Uday Abhishek on 25/08/26.
//

import SwiftUI
import CoreData

@main
struct NoteAppUsingCoreDataApp: App {
    let controller = PersistentController.shared
    
    var body: some Scene {
        WindowGroup {
            CreateNote()
                .environment(\.managedObjectContext, controller.container.viewContext)
        }
    }
}
