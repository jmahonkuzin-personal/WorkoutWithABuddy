//
//  WorkoutDay.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 9/29/24.
//

import Foundation
import SwiftUI

// Model to represent each day's workout
class WorkoutRoutineDay: Identifiable, Equatable, ObservableObject {
    let id = UUID()
    var dayOfWeek: String = ""
    var workoutRoutineType: WorkoutRoutineType = WorkoutRoutineType.rest
    
    init(dayOfWeek: String, workoutRoutineType: WorkoutRoutineType) {
        self.dayOfWeek = dayOfWeek
        self.workoutRoutineType = workoutRoutineType
    }
    
    // Custom implementation of Equatable
    static func == (lhs: WorkoutRoutineDay, rhs: WorkoutRoutineDay) -> Bool {
        return lhs.dayOfWeek == rhs.dayOfWeek && lhs.workoutRoutineType == rhs.workoutRoutineType
    }
}
