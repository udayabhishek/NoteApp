//
//  NoteViewModel.swift
//  NoteAppUsingCoreData
//
//  Created by Uday Abhishek on 25/08/26.
//

import Foundation
import CoreData
import Combine

@MainActor
final class NoteListViewModel: ObservableObject {
    
    @Published private(set) var notes: [Note] = []
    
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func fetchNotes() {
        let fetchRequest: NSFetchRequest<Note> = Note.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor.init(keyPath: \Note.createdAt, ascending: false)]
        
        do {
            notes = try context.fetch(fetchRequest)
        } catch {
            print(error.localizedDescription)
            notes = []
        }
    }
    
    func delete(_ indexSet: IndexSet) {
        for i in indexSet {
            context.delete(notes[i])
        }
        
        do {
            try context.save()
            fetchNotes()
        } catch  {
            print(error.localizedDescription)
        }
    }
    
}
