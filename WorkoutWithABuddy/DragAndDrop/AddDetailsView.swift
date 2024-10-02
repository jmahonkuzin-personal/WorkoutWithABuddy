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
    
    @State private var starterExerciseList = [
        Exercise(),
        Exercise(),
        Exercise() // maybe change to an Array() impl // need to save this into a larger
        // data structure
    ]
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 20)
            Text("Input workouts for \(workoutType.rawValue) day:")
                .font(.title)
                .bold()
            
            List {
                ForEach(starterExerciseList.indices, id: \.self) { index in
                    VStack {
                        Text("\(index + 1)")
                            .bold()
                        HStack(spacing: 5) {
                            Image(systemName: "line.3.horizontal")
                                .foregroundColor(.gray)
                                
                            SwiftUIExerciseInputView(
                                exercise: $starterExerciseList[index]
                            )
                            Spacer()
                            Button(action: {
                                removeItem(at: index)
                            }) {
                                Image(systemName: "xmark.circle")
                                    .foregroundColor(.red)
                            }
                        }
                    }
                }
                .onMove(perform: move)
            }
            .listStyle(PlainListStyle())
            .listRowSpacing(5)
            .scrollContentBackground(.hidden)
            
            
            Button(action: {
                addEmptyExerciseItem()
            }) {
                Text("Add another exercise")
                    .foregroundColor(.blue)
                    .font(.title3)
                    .underline()
            }
            
            Spacer()
                .frame(height: 40)
            
            ButtonsView()
        }
        .background(.gray)
    }
    
    func move(from source: IndexSet, to destination: Int) {
        starterExerciseList.move(fromOffsets: source, toOffset: destination)
    }
    
    func addEmptyExerciseItem() {
        starterExerciseList.append(Exercise())
    }
    
    func removeItem(at index: Int) {
        starterExerciseList.remove(at: index)
    }
}

struct AddDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        AddDetailsView(workoutType: WorkoutType.push)
    }
}
