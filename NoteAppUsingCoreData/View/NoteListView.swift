//
//  NoteList.swift
//  NoteAppUsingCoreData
//
//  Created by Uday Abhishek on 25/08/26.
//

import SwiftUI
import CoreData

struct NoteListView: View {

    @StateObject private var viewModel: NoteListViewModel
    
    init(context: NSManagedObjectContext) {
        _viewModel = StateObject(wrappedValue: NoteListViewModel(context: context))
    }
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(viewModel.notes) { note in
                    VStack(alignment: .leading) {
                        Text(note.title ?? "")
                            .font(.headline)
                        
                        Text(note.details ?? "")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            .lineLimit(2)
                    }
                }
            }
            .navigationTitle("Notes")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        let context = PersistentController.shared.container.viewContext
                        AddNoteView(context: context)
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .onAppear() {
                viewModel.fetchNotes()
            }
        }
        
        
    }
}

//#Preview {
//    NoteList()
//}
