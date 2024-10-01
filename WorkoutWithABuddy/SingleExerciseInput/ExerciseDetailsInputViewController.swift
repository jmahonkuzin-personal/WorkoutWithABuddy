//
//  ExerciseDetailsInputViewController.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 10/1/24.
//
import Foundation
import SwiftUI
import UIKit

class ExerciseDetailsInputViewController: UIViewController, UITextFieldDelegate {
    
    // UI elements
    var exerciseNameField: UITextField!
    var numRepsField: UITextField!
    var numSetsField: UITextField!
    var weightStackViewController: WeightStackViewController!
    var numRepsNumSetsViewController: SetsAndRepsNumView!
    let saveButton = UIButton(type: .system)
    
    // Weight Unit Selection
    let weightUnitControl = UISegmentedControl(items: ["lbs", "kg"])
    
    weak var delegate: ExerciseSaveDelegate?
    
    
    // ScrollView and StackView to hold saved exercises
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    
    let pythonDbService = PythonDbService()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
        exerciseNameField = ExerciseInputUiTextField(placeholder: "Exercise Name")
        numSetsField = ExerciseInputUiTextField(placeholder: "Sets")
        numRepsField = ExerciseInputUiTextField(placeholder: "Reps")
        
        exerciseNameField.delegate = self
        weightStackViewController = WeightStackViewController()
        let weightStackView = weightStackViewController.getWeightStackView()
        
        numRepsNumSetsViewController = SetsAndRepsNumView()
        let repsSetsStackView = numRepsNumSetsViewController.getStackView()
        
        // Add fields to the view and position them
        let inputStackView = UIStackView(arrangedSubviews: [exerciseNameField, weightStackView, repsSetsStackView])
        inputStackView.axis = .vertical
        inputStackView.spacing = 6
        inputStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(inputStackView)
        
        // Constraints for input fields
        NSLayoutConstraint.activate([
            inputStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            inputStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            inputStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            inputStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}

#Preview {
    ExerciseDetailsInputViewController()
}
