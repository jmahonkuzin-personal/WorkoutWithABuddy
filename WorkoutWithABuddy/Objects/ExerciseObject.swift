//
//  ExerciseObject.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 9/26/24.
//

import Foundation


class Exercise: Identifiable, Codable, Equatable {
    var id = UUID()
    var name: String = ""
    var weight: Int? = nil
    var weightUnit: WeightUnit = WeightUnit.pounds
    var sets: Int = 0
    var repsPerSet: Int? = nil
    var timeWorkout: Int? = nil
    var timeRest: Int? = nil
    var type: ExerciseTypeEnum = ExerciseTypeEnum.rep
    
    init() {}
    
    // Time based exercise
    init(name: String, sets: Int, timeWorkout: Int, timeRest: Int) {
        self.name = name
        self.sets = sets
        self.timeWorkout = timeWorkout
        self.timeRest = timeRest
        self.type = ExerciseTypeEnum.time
    }
    
    // Another Time based exercise
    init(name: String, weight: Int, weightUnit: WeightUnit, sets: Int, timeWorkout: Int, timeRest: Int) {
        self.name = name
        self.weight = weight
        self.weightUnit = weightUnit
        self.sets = sets
        self.timeWorkout = timeWorkout
        self.timeRest = timeRest
        self.type = ExerciseTypeEnum.time
    }
    
    // rep based
    init(name: String, weight: Int, weightUnit: WeightUnit, sets: Int, repsPerSet: Int) {
        self.name = name
        self.weight = weight
        self.weightUnit = weightUnit
        self.sets = sets
        self.repsPerSet = repsPerSet
        self.type = ExerciseTypeEnum.rep
    }
    
    static func == (lhs: Exercise, rhs: Exercise) -> Bool {
        return lhs.name == rhs.name && lhs.weight == rhs.weight && lhs.weightUnit == rhs.weightUnit && lhs.sets == rhs.sets
        && lhs.repsPerSet == rhs.repsPerSet && lhs.timeWorkout == rhs.timeWorkout && lhs.type == rhs.type
    }
}

