//
//  CreateNote.swift
//  NoteAppUsingCoreData
//
//  Created by Uday Abhishek on 25/08/26.
//

import SwiftUI
import CoreData

struct AddNoteView: View {
    
    @StateObject private var viewModel: AddNoteViewModel
    
    @Environment(\.dismiss) private var dismiss
    
    init(context: NSManagedObjectContext) {
        _viewModel = StateObject(wrappedValue: AddNoteViewModel(context: context))
    }
    
    var body: some View {
        Form {
            Section("Title") {
                TextField("Enter title", text: $viewModel.title)
            }
            
            Section("Detals") {
                TextEditor(text: $viewModel.details)
                    .frame(minHeight: 200)
            }
        }
        .navigationTitle("New note")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    viewModel.saveNote()
                    dismiss()
                }
                .disabled(viewModel.title
                    .trimmingCharacters(in: .whitespacesAndNewlines)
                    .isEmpty)
            }
        }
    }
}


