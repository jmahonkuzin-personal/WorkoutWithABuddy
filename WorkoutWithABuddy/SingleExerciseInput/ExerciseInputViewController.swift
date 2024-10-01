//
//  ExerciseInput.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 9/24/24.

// next steps: on save, clear out all of the text fields using a delegate. On save also, send a POST API
// request via our python server
//

import Foundation

import UIKit
import SwiftUI

class ExerciseInputViewController: UIViewController, UITextFieldDelegate {

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
        
        setupInputFields()
        setupSaveButton()
        setupScrollView()
    }
    
    func setupInputFields() {
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
            inputStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            inputStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            inputStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    func setupSaveButton() {
        // Configure Save Button
        saveButton.setTitle("Save", for: .normal)
        saveButton.isEnabled = false // Initially disabled
        saveButton.addTarget(self, action: #selector(saveExercise), for: .touchUpInside)
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(saveButton)
        
        // Constraints for Save Button
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: numRepsField.bottomAnchor, constant: 20),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func setupScrollView() {
        // Configure Scroll View
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        // Configure StackView inside ScrollView
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(stackView)
        
        // Constraints for Scroll View and Stack View
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 20),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    @objc func saveExercise() {
            // Get the inputs
        let exercise = exerciseNameField.text ?? ""
        let weight = weightField.text ?? ""
        let sets = numSetsField.text ?? ""
        let reps = numRepsField.text ?? ""
        
        // Get the selected weight unit (kg or lbs)
        let weightUnit = weightStackViewController.getSelectedWeightUnit()
        
        
        let newExercise = Exercise(
            name: "exercise",
            weight: weight,
            weightUnit: weightUnit,
            sets: sets,
            reps: reps,
            time: "100"
        )
        pythonDbService.saveExercise(exercise: newExercise)
        
        // Create a label with the input values formatted
        let exerciseLabel = UILabel()
        exerciseLabel.numberOfLines = 0
        exerciseLabel.text = "Exercise: \(exercise)\nWeight: \(weight) \(weightUnit)\nSets: \(sets)\nReps: \(reps)"
        exerciseLabel.font = UIFont.systemFont(ofSize: 16)
        
        // Add the label to the stack view inside the scroll view
        stackView.addArrangedSubview(exerciseLabel)
        
        // Clear the input fields
        // move these to delegates, where each item just responds to an action
        exerciseNameField.text = ""
        weightField.text = ""
        numSetsField.text = ""
        numRepsField.text = ""
        
        // Disable save button again until new input
        saveButton.isEnabled = false
    }
    
    // UITextFieldDelegate method to check for input in exerciseTextField
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? string
        // Enable save button if exercise text field is not empty
        saveButton.isEnabled = !currentText.isEmpty
        return true
    }
}

#Preview {
    ExerciseInputViewController()
}
