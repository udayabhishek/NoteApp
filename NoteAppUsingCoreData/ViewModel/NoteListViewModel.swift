//
//  NoteViewModel.swift
//  NoteAppUsingCoreData
//
//  Created by Uday Abhishek on 25/08/26.
//

import Foundation
import CoreData
import Combine

class NoteListViewModel: ObservableObject {
    
    @Published private(set) var notes: [Note] = []
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func create() {
        
    }
    
    func fetchNotes() {
        let fetchRequest: NSFetchRequest<Note> = Note.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor.init(keyPath: \Note.createdAt, ascending: true)]
        
        do {
            notes = try context.fetch(fetchRequest)
        } catch {
            print(error.localizedDescription)
            notes = []
        }
    }
    
    func update() {
        
    }
    
    func delete() {
        
    }
    
    
}
