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
    @Published var isEditing = false
    
    private let context: NSManagedObjectContext
    private var note: Note?
    
    init(context: NSManagedObjectContext, note: Note? = nil) {
        self.context = context
        self.note = note
        self.isEditing = note != nil
    }
    
    func saveNote() {
        let trimmedTitle = title.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !trimmedTitle.isEmpty else { return }
        
        if let note { //Update
            note.title = trimmedTitle
            note.details = details
        } else { //Create
            let newNote = Note(context: context)
            
            newNote.title = trimmedTitle
            newNote.details = details
            newNote.createdAt = Date()
        }
        
        do {
            try context.save()
        } catch {
            print("Failed to save note: \(error)")
        }
    }
    
    func startEditing() {
        isEditing = true
    }
    
    func selectedNote(_ selectedNote: Note? = nil) {
        self.note = selectedNote
    }
}
