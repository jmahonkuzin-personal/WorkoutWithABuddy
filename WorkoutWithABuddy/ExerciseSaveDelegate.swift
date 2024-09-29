//
//  ExerciseSaveDelegate.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 9/25/24.
//

import Foundation


// Define a protocol for communication
protocol ExerciseSaveDelegate: AnyObject {
    func didExerciseSave(data: String)
}
