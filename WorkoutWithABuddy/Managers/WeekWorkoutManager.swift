//
//  WorkoutManager.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 9/29/24.
//

import Foundation


class WeeklyRoutineManager: ObservableObject {
    // Dictionary to hold the routine names for each day
    @Published var routines: [String: WorkoutRoutineType] = [
        "Monday": WorkoutRoutineType.rest,
        "Tuesday": WorkoutRoutineType.rest,
        "Wednesday": WorkoutRoutineType.rest,
        "Thursday": WorkoutRoutineType.rest,
        "Friday": WorkoutRoutineType.rest,
        "Saturday": WorkoutRoutineType.rest,
        "Sunday": WorkoutRoutineType.rest
    ]
    @Published var selectedDay: String?
    
    // Optional function to update a specific day's routine
    func updateRoutine(for day: String, with routine: WorkoutRoutineType) {
        routines[day] = routine
    }
    
    func updateSelectedDay(to day: String?) {
        selectedDay = day
    }
}




//class WeekWorkoutManager: ObservableObject {
//    @Published var workouts: [WorkoutRoutineDay]
//    @Published var selectedWorkoutRoutineDay: WorkoutRoutineDay = "Running"
//    
//    init() {
//        self.workouts = [
//            WorkoutRoutineDay(dayOfWeek: "Sun", workoutRoutineType: WorkoutRoutineType.rest),
//            WorkoutRoutineDay(dayOfWeek: "Mon", workoutRoutineType: WorkoutRoutineType.rest),
//            WorkoutRoutineDay(dayOfWeek: "Tue", workoutRoutineType: WorkoutRoutineType.rest),
//            WorkoutRoutineDay(dayOfWeek: "Wed", workoutRoutineType: WorkoutRoutineType.rest),
//            WorkoutRoutineDay(dayOfWeek: "Thu", workoutRoutineType: WorkoutRoutineType.rest),
//            WorkoutRoutineDay(dayOfWeek: "Fri", workoutRoutineType: WorkoutRoutineType.rest),
//            WorkoutRoutineDay(dayOfWeek: "Sat", workoutRoutineType: WorkoutRoutineType.rest)
//        ]
//    }
//    
//    func getWorkoutRoutineDay(forDay day: String) -> WorkoutRoutineDay {
//        return workouts.first { $0.dayOfWeek == day } ?? WorkoutRoutineDay(dayOfWeek: "", workoutRoutineType: WorkoutRoutineType.rest)
//    }
//    
//    func updateWorkoutRoutineType(forDay day: String, withWorkout workout: WorkoutRoutineType) {
//        if let index = workouts.firstIndex(where: { $0.dayOfWeek == day }) {
//            workouts[index].workoutRoutineType = workout
//        }
//    }
//}
