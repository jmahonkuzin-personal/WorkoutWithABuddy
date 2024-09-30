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
            WorkoutDay(dayOfWeek: "Mon"),
            WorkoutDay(dayOfWeek: "Tue"),
            WorkoutDay(dayOfWeek: "Wed"),
            WorkoutDay(dayOfWeek: "Thu"),
            WorkoutDay(dayOfWeek: "Fri"),
            WorkoutDay(dayOfWeek: "Sat"),
            WorkoutDay(dayOfWeek: "Sun")
        ]
    }
    
    // Function to retrieve a workout by day
    func workout(forDay day: String) -> WorkoutType {
        let first = workouts.first { $0.dayOfWeek == day }
        return first?.workout ?? WorkoutType(name: "Core", icon: "flame")
    }
    
    // Function to update a workout by day
    func updateWorkout(forDay day: String, withWorkout workout: WorkoutType) {
        if let index = workouts.firstIndex(where: { $0.dayOfWeek == day }) {
            workouts[index].workout = workout
        }
    }
}
