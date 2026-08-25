//
//  Note.swift
//  NoteAppUsingCoreData
//
//  Created by Uday Abhishek on 25/08/26.
//

import Foundation

struct NoteItem: Identifiable {
    var id: UUID
    let title: String = ""
    let details: String = ""
}
