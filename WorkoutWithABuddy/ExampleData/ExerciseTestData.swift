//
//  ExerciseTestData.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 10/5/24.
//

import Foundation



// we also need notes that a user can add that they remember for the next time
// we also need something for super sets and for circuits
class ExerciseTestData {
    // rep based
    let repEx1 = Exercise(name: "Dumbbell Squat", weight: 50,
                      weightUnit: WeightUnit.pounds,
                      sets: 3, repsPerSet: 15)
    // I think we need something for dummbbells vs barbell, and for each leg
    let repEx2 = Exercise(name: "Dumbbell Lunge", weight: 25,
                      weightUnit: WeightUnit.pounds,
                      sets: 3, repsPerSet: 15)
    let repEx3 = Exercise(name: "Seated Calf Raise", weight: 20,
                      weightUnit: WeightUnit.pounds,
                      sets: 3, repsPerSet: 15)
    let repEx4 = Exercise(name: "Leg Press", weight: 200,
                      weightUnit: WeightUnit.pounds,
                      sets: 3, repsPerSet: 8)
    let repEx5 = Exercise(name: "Squats", weight: 185,
                      weightUnit: WeightUnit.pounds,
                      sets: 4, repsPerSet: 8)
    
    // time based
    let timeEx1 = Exercise(name: "Plank", sets: 3,
                           timeWorkout: 60, timeRest: 60)
    let timeEx2 = Exercise(name: "Lemon Squeezers", sets: 2,
                           timeWorkout: 60, timeRest: 60)
    let timeEx3 = Exercise(name: "30-60-90s", sets: 1,
                           timeWorkout: 30, timeRest: 30)
    let timeEx4 = Exercise(name: "Bicycle crunch", sets: 1,
                           timeWorkout: 30, timeRest: 30)
    let timeEx5 = Exercise(name: "Russian twist", weight: 20,
                      weightUnit: WeightUnit.pounds,
                      sets: 4, timeWorkout: 30, timeRest: 30)
    
    var exercisesTest1: [Exercise] = []
    var exercisesTest2: [Exercise] = []
    var exercisesTest3: [Exercise] = []

    
    init() {
        exercisesTest1.append(timeEx1)
        exercisesTest1.append(timeEx2)
        exercisesTest1.append(timeEx3)
        exercisesTest1.append(timeEx4)
        
        exercisesTest2.append(repEx1)
        exercisesTest2.append(repEx2)
        exercisesTest2.append(repEx3)
        exercisesTest2.append(repEx4)
        exercisesTest2.append(repEx5)
        
        exercisesTest3.append(repEx1)
        exercisesTest3.append(repEx2)
        exercisesTest3.append(repEx3)
        exercisesTest3.append(timeEx3)
        exercisesTest3.append(timeEx4)
    }
}
