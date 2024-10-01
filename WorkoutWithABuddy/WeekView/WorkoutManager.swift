//
//  WorkoutManager.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 9/29/24.
//

import Foundation


// Model representing the workout for the entire week
class WorkoutManager: ObservableObject {
    @Published var workouts: [WorkoutDay]
    
    init() {
        self.workouts = [
            WorkoutDay(dayOfWeek: "Mon", workout: WorkoutType.rest),
            WorkoutDay(dayOfWeek: "Tue", workout: WorkoutType.rest),
            WorkoutDay(dayOfWeek: "Wed", workout: WorkoutType.rest),
            WorkoutDay(dayOfWeek: "Thu", workout: WorkoutType.rest),
            WorkoutDay(dayOfWeek: "Fri", workout: WorkoutType.rest),
            WorkoutDay(dayOfWeek: "Sat", workout: WorkoutType.rest),
            WorkoutDay(dayOfWeek: "Sun", workout: WorkoutType.rest)
        ]
    }
    
    // Function to retrieve a workout by day
    func getWorkout(forDay day: String) -> WorkoutType {
        let first = workouts.first { $0.dayOfWeek == day }
        return first?.workout ?? WorkoutType.rest
    }
    
    // Function to update a workout by day
    func updateWorkout(forDay day: String, withWorkout workout: WorkoutType) {
        if let index = workouts.firstIndex(where: { $0.dayOfWeek == day }) {
            workouts[index].workout = workout
        }
    }
}
