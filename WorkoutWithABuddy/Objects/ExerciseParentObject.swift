//
//  ExerciseParentObject.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 10/4/24.
//

import Foundation

struct ExerciseParentObject: Identifiable {
    var id = UUID()
    var name: Date
    var type: WeightUnit
}
