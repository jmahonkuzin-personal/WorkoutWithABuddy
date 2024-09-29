//
//  WeightFieldView.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 9/25/24.
//

import Foundation
import SwiftUI 


class WeightFieldView: UITextField {
    
//    let weightField = UITextField()
    let weightUnitSegmentedControl = WeightUnitView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupWeightFieldView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Weight Unit Selection
    
    func setupWeightFieldView() {
        self.placeholder = "Weight (lbs)"
        self.borderStyle = .roundedRect
        // Set specific constraints for the weight field to take half of the available width
        
        let screenWidth = UIScreen.main.bounds.width
        self.widthAnchor.constraint(equalToConstant: (screenWidth / 2)).isActive = true
        
    }

}
