//
//  AddDetailsView.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 10/1/24.
//

import Foundation

import SwiftUI

// ObservableObject class with a @Published property
//class WorkoutTypeDetailsObservable: ObservableObject {
//    @Published var details: DraggableWorkoutDetailsItem?
//}
//
//struct DraggableWorkoutDetailsItem: Identifiable, Hashable {
//    let id = UUID()
//    var text: String
//}

// The view that holds the day name and icon
struct AddDetailsView: View {
    
    @State private var draggedExercise: Exercise?
    @State private var exerciseList: [Exercise] = []
    let emptyExerciseList = Array(repeating: Exercise(), count: 3)
    
    var body: some View {
        ScrollView(showsIndicators: false, content: {
            VStack(spacing: 10, content: {
                Spacer()
                    .frame(height: 80)
                
                let eList = exerciseList.isEmpty == false ? exerciseList : emptyExerciseList
                
                ForEach(eList, id: \.self) { e in
                    ExerciseInputControllerWrapper()
                        .frame(width: 350, height: 150)
                        .cornerRadius(10)
                        .onDrag({
                            self.draggedExercise = e
                            return NSItemProvider()
                        })
                }
                
                Spacer()
                    .frame(height: 20)
                
                ButtonsView()
            })
            .padding(.horizontal, 20)
        })
        .ignoresSafeArea()
    }
}


struct AddDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        AddDetailsView()
    }
}
