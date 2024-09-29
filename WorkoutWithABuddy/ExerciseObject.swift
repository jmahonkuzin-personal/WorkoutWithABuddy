//
//  ExerciseObject.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 9/26/24.
//

import Foundation


struct Exercise: Codable {
    let name: String
    let weight: String // change to numbers at some point, but we can just store as strings for now in this struct
    let weightUnit: String
    let sets: String
    let reps: String
    let time: String
}
