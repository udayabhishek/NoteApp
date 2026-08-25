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
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
        _viewModel = StateObject(wrappedValue: NoteListViewModel(context: context))
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.notes) { note in
                    NavigationLink {
                        AddNoteView(context: context, note: note)
                    } label: {
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
                .onDelete(perform: viewModel.delete)
            }
            
            .refreshable {
                viewModel.fetchNotes()
            }
            .navigationTitle("Notes")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
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
