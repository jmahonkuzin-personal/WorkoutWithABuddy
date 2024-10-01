//
//  FruitItemView.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 10/1/24.
//

import SwiftUI

struct WorkoutItemView: View {
    
    var body: some View {
        ExerciseInputControllerWrapper()
            .frame(width: 350, height: 200)
            .cornerRadius(10)
    }
}
