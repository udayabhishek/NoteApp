//
//  CreateNote.swift
//  NoteAppUsingCoreData
//
//  Created by Uday Abhishek on 25/08/26.
//

import SwiftUI
import CoreData

struct CreateNote: View {
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Note.title, ascending: true)]) private var notes: FetchedResults<Note>
    
    @Environment(\.managedObjectContext) private var context
    
    @State private var name: String = ""
    @State private var details: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Enter title", text: $name)
                TextField("Details...", text: $details)
                
                Button("Save") {
                    createNote()
                }
                .padding()
                
                Spacer()
                
                List {
                    ForEach(notes) { note in
                        Text(note.title ?? "")
                            .font(.title)
                    }
                }
            }
            .navigationTitle("Notes")
            .padding()
        }
    }
    
    func createNote() {
        let note = Note(context: context)
        note.title = name
        note.details = details
        
        do {
            try context.save()
        } catch  {
            print(error.localizedDescription)
        }
    }
}

#Preview {
    CreateNote()
}
