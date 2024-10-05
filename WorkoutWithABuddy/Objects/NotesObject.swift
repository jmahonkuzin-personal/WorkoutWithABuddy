//
//  NotesObject.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 10/4/24.
//

import Foundation

struct NotesObject: Identifiable {
    var id = UUID()
    var name: Date
    var text: String
}
