//
//  ExerciseObject.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 9/26/24.
//

import Foundation


struct Exercise: Identifiable, Codable, Equatable, Hashable {
    var id = UUID()
    var name: String
    var weight: String // change to numbers at some point, but we can just store as strings for now
    var weightUnit: String
    var sets: String
    var reps: String
    var time: String
    
    init(name: String, weight: String, weightUnit: String, sets: String, reps: String, time: String) {
        self.name = name
        self.weight = weight
        self.weightUnit = weightUnit
        self.sets = sets
        self.reps = reps
        self.time = time
    }
    
    init(name: String) {
        self.name = name
        self.weight = ""
        self.weightUnit = "lbs"
        self.sets = ""
        self.reps = ""
        self.time = ""
    }
    
    init() {
        self.name = ""
        self.weight = ""
        self.weightUnit = "lbs"
        self.sets = ""
        self.reps = ""
        self.time = ""
    }
}

