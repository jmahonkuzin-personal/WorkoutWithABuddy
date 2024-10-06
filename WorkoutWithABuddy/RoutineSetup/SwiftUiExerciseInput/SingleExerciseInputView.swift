//
//  SingleExerciseInputView.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 10/1/24.
//

import SwiftUI

struct SingleExerciseInputView: View {
    @Binding var exercise: Exercise
    
    var body: some View {
        VStack {
            TextField("Name", text: $exercise.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            HStack {
                Text("Weight:")
                TextField("Weight", value: $exercise.weight, formatter: NumberFormatter())
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                WeightUnitPickerView(selectedWeightUnit: $exercise.weightUnit)
            }
            HStack {
                Text("Reps:")
                TextField("Number of reps", value: $exercise.repsPerSet, formatter: NumberFormatter())
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text("Sets:")
                TextField("Number of sets", value: $exercise.sets, formatter: NumberFormatter())
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
        }
    }
}

struct ParentView: View {
    @State private var exercise: Exercise = Exercise()
    
    var body: some View {
        VStack {
            SingleExerciseInputView(exercise: $exercise)
        }
    }
}

struct SwiftUIExerciseInputView_Previews: PreviewProvider {
    static var previews: some View {
        ParentView()
    }
}
