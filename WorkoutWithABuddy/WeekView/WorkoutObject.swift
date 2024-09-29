//
//  WorkoutObject.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 9/29/24.
//

import Foundation


// Model to represent each day's workout
struct WorkoutObject: Identifiable {
    let id = UUID()
    let title: String
    let icon: String
}
