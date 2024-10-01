//
//  SetsAndRepsNumView.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 10/1/24.
//

import Foundation

import SwiftUI


class SetsAndRepsNumView {
    var setsRepsHorizontalStack: UIStackView!
    
    var numRepsTextField: UITextField!
    var numSetsTextField: UITextField!
    
    init() {
        setupStackView()
    }
    
    func setupStackView() {
        numRepsTextField = ExerciseInputUiTextField(placeholder: "Reps")
        numSetsTextField = ExerciseInputUiTextField(placeholder: "Sets")

        setsRepsHorizontalStack = UIStackView(arrangedSubviews: [numRepsTextField, numSetsTextField])
        
        setsRepsHorizontalStack.axis = .horizontal
        setsRepsHorizontalStack.spacing = 10
        setsRepsHorizontalStack.distribution = .fillEqually
        setsRepsHorizontalStack.translatesAutoresizingMaskIntoConstraints = false
    }

    
    // Method to return the stack view
    func getStackView() -> UIStackView {
        return setsRepsHorizontalStack
    }
//    
//    // Method to return the stack view
//    func getSelectedWeightUnit() -> String {
//        return weightUISegmentedControl.titleForSegment(at: weightUISegmentedControl.selectedSegmentIndex) ?? "lbs"
//    }
}
