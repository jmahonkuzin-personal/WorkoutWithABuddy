//
//  WorkoutDay.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 9/29/24.
//

import Foundation
import SwiftUI

// Model to represent each day's workout
struct WorkoutDay: Identifiable, Equatable {
    let id = UUID()
    var dayOfWeek: String
    var workout: WorkoutType
    
    // Custom implementation of Equatable
    static func == (lhs: WorkoutDay, rhs: WorkoutDay) -> Bool {
        return lhs.dayOfWeek == rhs.dayOfWeek && lhs.workout == rhs.workout
    }
}
