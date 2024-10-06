//
//  ButtonsView.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 10/1/24.
//

import SwiftUI

struct ButtonsView: View {
    @StateObject private var service = PythonDbService()
    @Binding var exerciseList: [Exercise]
    
    var body: some View {
        VStack {
            if (service.isErrored) {
                Text("error")
            }
            if (service.isSuccess) {
                Text("success")
            }
            Text(service.responseData)
            HStack {
                // Cancel Button
                Button(action: {
                    // Add your cancel logic here
                    print("Cancel button tapped")
                }) {
                    Text("Cancel")
                        .frame(minWidth: 0, maxWidth: 80)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Spacer()
                
                Button(action: {
                    print("Save button tapped)")
                    service.saveExercises(exercises: exerciseList)
                }) {
                    Text("Save")
                        .frame(minWidth: 0, maxWidth: 80)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
        .padding(.horizontal)
    }
}


struct ButtonsView_ParentView: View {
    @State private var exerciseList: [Exercise] = ExerciseTestData().exercisesTest1

    var body: some View {
        VStack {
            ButtonsView(exerciseList: $exerciseList)
        }
    }
}

struct ButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsView_ParentView()
    }
}
