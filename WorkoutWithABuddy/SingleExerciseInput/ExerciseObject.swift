//
//  ExerciseObject.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 9/26/24.
//

import Foundation


struct Exercise: Codable, Equatable, Hashable {
    let name: String
    let weight: String // change to numbers at some point, but we can just store as strings for now
    let weightUnit: String
    let sets: String
    let reps: String
    let time: String
    
    init(name: String, weight: String, weightUnit: String, sets: String, reps: String, time: String) {
        self.name = name
        self.weight = weight
        self.weightUnit = weightUnit
        self.sets = sets
        self.reps = reps
        self.time = time
    }
    
    init() {
        self.name = ""
        self.weight = ""
        self.weightUnit = ""
        self.sets = ""
        self.reps = ""
        self.time = ""
    }
}

