//
//  AddNoteViewModel.swift
//  NoteAppUsingCoreData
//
//  Created by Uday Abhishek on 25/08/26.
//

import Foundation
import CoreData
import Combine

@MainActor
final class AddNoteViewModel: ObservableObject {
    @Published var title = ""
    @Published var details = ""
    
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func saveNote() {
        let note = Note(context: context)
        
        note.title = title
        note.details = details
        note.createdAt = Date()
        
        do {
            try context.save()
        } catch {
            print("Failed to save note: \(error)")
        }
    }
}
