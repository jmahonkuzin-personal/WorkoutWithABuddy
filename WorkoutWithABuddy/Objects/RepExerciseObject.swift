//
//  RepExerciseObject.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 10/4/24.
//

import Foundation

struct RepExerciseObject: Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var reps_per_set: Int
    var sets: Int
    var notes: [NotesObject]
}
