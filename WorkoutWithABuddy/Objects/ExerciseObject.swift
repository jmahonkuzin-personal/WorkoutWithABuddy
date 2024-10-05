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
    var weight: Int = 0
    var weightUnit: WeightUnit = WeightUnit.lbs
    var sets: Int = 0
    var repsPerSet: Int = 0
    var time: Int = 0
    var type: ExerciseTypeEnum = ExerciseTypeEnum.rep
    
    init() {}
    
    init(name: String, weight: Int, weightUnit: WeightUnit, sets: Int, repsPerSet: Int, time: Int, type: ExerciseTypeEnum) {
        self.name = name
        self.weight = weight
        self.weightUnit = weightUnit
        self.sets = sets
        self.repsPerSet = repsPerSet
        self.time = time
        self.type = type
    }
    
    init(name: String) {
        self.name = name
    }
    
    static func == (lhs: Exercise, rhs: Exercise) -> Bool {
        return lhs.name == rhs.name && lhs.weight == rhs.weight && lhs.weightUnit == rhs.weightUnit && lhs.sets == rhs.sets
        && lhs.repsPerSet == rhs.repsPerSet && lhs.time == rhs.time && lhs.type == rhs.type
    }
}

