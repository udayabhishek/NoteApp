//
//  NoteList.swift
//  NoteAppUsingCoreData
//
//  Created by Uday Abhishek on 25/08/26.
//

import SwiftUI
import SwiftData

struct NoteList: View {
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Note.title, ascending: true)]) private var notes: FetchedResults<Note>
    
    @Environment(\.managedObjectContext) private var context
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(notes) { note in
                    NavigationLink {
                        CreateNote()
                    } label: {
                        Text(note.title ?? "")
                            .font(.title)
                    }
                }
            }
            .navigationTitle("Notes")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        CreateNote()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        
        
    }
}

#Preview {
    NoteList()
}
