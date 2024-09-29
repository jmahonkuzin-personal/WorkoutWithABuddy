//
//  WorkoutDay.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 9/29/24.
//

import Foundation
import SwiftUI

enum Workout : String {
    case Core = "figure.core.training"
    case Push = "figure.strengthtraining.traditional"
    case Pull = "figure.play"
    case Walk = "figure.walk"
    case Run = "figure.run"
    case Stretch = "figure.flexibility"
}

enum WorkoutType {
  case name(String)
  case icon(String)
}

// Model to represent each day's workout
struct WorkoutDay: Identifiable, Equatable {
    let id = UUID()
    let dayOfWeek: String
    let workout: Workout
    
    // Custom implementation of Equatable
    static func == (lhs: WorkoutDay, rhs: WorkoutDay) -> Bool {
        return lhs.dayOfWeek == rhs.dayOfWeek && lhs.workout == rhs.workout
    }
}

// Model representing the workout for the entire week
struct WeekWorkout {
    var days: [WorkoutDay]
    
    init() {
        days = [
            WorkoutDay(dayOfWeek: "Mon", workout: Workout.Core),
            WorkoutDay(dayOfWeek: "Tue", workout: Workout.Walk),
            WorkoutDay(dayOfWeek: "Wed", workout: Workout.Push),
            WorkoutDay(dayOfWeek: "Thu", workout: Workout.Core),
            WorkoutDay(dayOfWeek: "Fri", workout: Workout.Pull),
            WorkoutDay(dayOfWeek: "Sat", workout: Workout.Run),
            WorkoutDay(dayOfWeek: "Sun", workout: Workout.Stretch)
        ]
    }
}
