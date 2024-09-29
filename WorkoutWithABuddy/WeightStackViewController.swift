//
//  WeightStackView.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 9/25/24.
//

import Foundation

import SwiftUI


class WeightStackViewController {
    
    var weightHorizontalStack: UIStackView!
    var weightUITextField: UITextField!
    var weightUISegmentedControl: UISegmentedControl!
    
    init() {
        setupStackView()
    }
    
    func setupStackView() {
        weightUITextField = WeightFieldView()
        weightUISegmentedControl = WeightUnitView()
        
        weightUISegmentedControl.addTarget(self, action: #selector(weightUnitChanged), for: .valueChanged)
        
        weightHorizontalStack = UIStackView(arrangedSubviews: [weightUITextField, weightUISegmentedControl])
        
        weightHorizontalStack.axis = .horizontal
        weightHorizontalStack.spacing = 10
        weightHorizontalStack.distribution = .fillEqually
        weightHorizontalStack.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc func weightUnitChanged() {
        // Update the placeholder in weightTextField when the unit changes
        updateWeightPlaceholder()
    }
    
    func updateWeightPlaceholder() {
        // Get the selected segment and update the placeholder text
        let selectedUnit = weightUISegmentedControl.titleForSegment(at: weightUISegmentedControl.selectedSegmentIndex)
        weightUITextField.placeholder = "Weight (\(selectedUnit ?? "lbs"))"
    }
    
    // Method to return the stack view
    func getWeightStackView() -> UIStackView {
        return weightHorizontalStack
    }
    
    // Method to return the stack view
    func getSelectedWeightUnit() -> String {
        return weightUISegmentedControl.titleForSegment(at: weightUISegmentedControl.selectedSegmentIndex) ?? "lbs"
    }
}
