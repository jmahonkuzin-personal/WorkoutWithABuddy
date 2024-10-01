//
//  ExerciseInputControllerWrapper.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 10/1/24.
//

import SwiftUI

struct ExerciseInputControllerWrapper: UIViewControllerRepresentable {
    
    // This function creates and returns the UIViewController instance
    func makeUIViewController(context: Context) -> ExerciseDetailsInputViewController {
        return ExerciseDetailsInputViewController()
    }
    
    // This function updates the view controller, if necessary
    func updateUIViewController(_ uiViewController: ExerciseDetailsInputViewController, context: Context) {
        // Update the view controller if needed
    }
}
