//
//  WeightUnitView.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 9/25/24.
//

import Foundation
import UIKit


// Data class for holding multiple trivia questions
class WeightUnitView: UISegmentedControl {
    
//    let weightUnitControl = UISegmentedControl(items: ["lbs", "kg"])
    
    let items = ["lbs", "kg"]
    
    init() {
        super.init(items: items)
        setupWeightUnitControlView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Weight Unit Selection
    
    func setupWeightUnitControlView() {
        
        self.selectedSegmentIndex = 0
        self.translatesAutoresizingMaskIntoConstraints = false

        // Set custom tint color
        self.selectedSegmentTintColor = UIColor.systemBlue
        
        // Customize text color for the segments
        let normalAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.darkGray,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .medium)
        ]
        
        let selectedAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .bold)
        ]
        
        self.setTitleTextAttributes(normalAttributes, for: .normal)
        self.setTitleTextAttributes(selectedAttributes, for: .selected)
        
        // Add any additional custom behavior here
        // For example, you can set a custom border or add padding to the segments.
        self.layer.cornerRadius = 8
        self.clipsToBounds = true
    }

}
