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
    var weightField: UITextField!
    var numRepsField: UITextField!
    var numSetsField: UITextField!
    var weightStackViewController: WeightStackViewController!
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
        weightField = ExerciseInputUiTextField(placeholder: "Weight (lbs)")
        numSetsField = ExerciseInputUiTextField(placeholder: "Sets")
        numRepsField = ExerciseInputUiTextField(placeholder: "Reps")
        
        // Set delegates to self for exercise field to monitor input
        // This line tells the text field that the view controller (self) should be notified of changes in the text field’s state or content. The view controller must conform to the UITextFieldDelegate protocol to handle these notifications.
        exerciseNameField.delegate = self // to know when to enable/disable the save button!
        
        // Add a horizontal stack view for the weight input and unit control
        weightStackViewController = WeightStackViewController()
        let weightStackView = weightStackViewController.getWeightStackView()
        
        // Add fields to the view and position them
        let inputStackView = UIStackView(arrangedSubviews: [exerciseNameField, weightStackView, numSetsField, numRepsField])
        inputStackView.axis = .vertical
        inputStackView.spacing = 10
        inputStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(inputStackView)
        
        // Constraints for input fields
        NSLayoutConstraint.activate([
            inputStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            inputStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            inputStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            inputStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
//            inputStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
//            inputStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            inputStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
//        NSLayoutConstraint.activate([
//            inputStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
//            inputStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            inputStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
////        ])
    }
}

#Preview {
    ExerciseDetailsInputViewController()
}
