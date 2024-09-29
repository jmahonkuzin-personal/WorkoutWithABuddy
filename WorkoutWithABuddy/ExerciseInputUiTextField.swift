//
//  ExerciseInputUiTextField.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 9/25/24.
//

import Foundation
import UIKit

class ExerciseInputUiTextField: UITextField, ExerciseSaveDelegate {
    
    func didExerciseSave(data: String) {
        self.text = ""
    }
    
    init(placeholder: String) {
        super.init(frame: CGRect(x: 20, y: 100, width: 300, height: 40))
        self.placeholder = placeholder
        self.borderStyle = .roundedRect
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
