//
//  AddDetailsView.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 10/1/24.
//

import Foundation

import SwiftUI

struct AddDetailsView: View {
    
    var workoutType: WorkoutType
    
    @State private var exerciseList = [
        Exercise(),
        Exercise(),
        Exercise() // maybe change to an Array() impl // need to save this into a larger
        // data structure
    ]
    
    var body: some View {
        VStack {
//            Spacer()
//                .frame(height: 20)
            Text("Add workouts for \(workoutType.rawValue) day:")
                .font(.system(size:28))
                .bold()
            
            List {
                ForEach(exerciseList.indices, id: \.self) { index in
                    HStack {
                    SingleExerciseInputView(
                        exercise: $exerciseList[index]
                    )
//                    HStack {
//                        SwiftUIExerciseInputView(
//                            exercise: $exerciseList[index]
//                        )
                        
//                        Text("\(index + 1)")
//                            .bold()
//                            .frame(width: 20, height: 30)
//                            .background(Color.gray.opacity(0.2))
//                            .clipShape(.capsule)
//                        
//                        SwiftUIExerciseInputView(
//                            exercise: $exerciseList[index]
//                        )
//                        Button(action: {
//                            removeItem(at: index)
//                        }) {
//                            Image(systemName: "xmark.circle")
//                                .foregroundColor(.red)
//                        }
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.gray)
                    }.listRowInsets(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                }
                .onMove(perform: move)
                .onDelete(perform: delete)  // Enable swipe to delete
            }
            .listStyle(.plain)
            .listRowSpacing(5)
            .scrollContentBackground(.hidden)
            
            Button(action: {
                addEmptyExerciseItem()
            }) {
                Text("Add another exercise")
                    .foregroundColor(.blue)
                    .font(.system(size:25)) // more consistent way to size a font!!!
                    .underline()
            }
            
            Spacer()
                .frame(height: 40)
            
            ButtonsView(
                exerciseList: $exerciseList
            )
        }
        .background(.gray)
    }
    
    func move(from source: IndexSet, to destination: Int) {
        exerciseList.move(fromOffsets: source, toOffset: destination)
    }
    
    func delete(at offsets: IndexSet) {
        exerciseList.remove(atOffsets: offsets)
    }
    
    func addEmptyExerciseItem() {
        exerciseList.append(Exercise())
    }
    
    func removeItem(at index: Int) {
        exerciseList.remove(at: index)
    }
}

struct AddDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        AddDetailsView(workoutType: WorkoutType.push)
    }
}
