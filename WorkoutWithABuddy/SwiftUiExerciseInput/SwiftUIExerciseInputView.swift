//
//  SwiftUIView.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 10/1/24.
//

import SwiftUI

struct SwiftUIExerciseInputView: View {
    @Binding var exercise: Exercise
    
    var body: some View {
        VStack {
            TextField("Exercise name", text: $exercise.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            HStack {
                TextField("Weight", text: $exercise.weight)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                WeightUnitPickerView(selectedWeightUnit: $exercise.weightUnit)
            }
            HStack {
                TextField("Number of reps", text: $exercise.reps)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Number of sets", text: $exercise.sets)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
        }
    }
}

struct ParentView: View {
    @State private var exercise: Exercise = Exercise()

    var body: some View {
        VStack {
            SwiftUIExerciseInputView(exercise: $exercise)
        }
        .padding()
    }
}

struct SwiftUIExerciseInputView_Previews: PreviewProvider {
    static var previews: some View {
        ParentView()
    }
}
