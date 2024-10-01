//
//  DropExerciseViewDelegate.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 10/1/24.
//

import SwiftUI


struct DropExerciseViewDelegate: DropDelegate {
    
    let destinationItem: Exercise
    @Binding var exerciseList: [Exercise]
    @Binding var draggedItem: Exercise?
    
    func dropUpdated(info: DropInfo) -> DropProposal? {
        return DropProposal(operation: .move)
    }
    
    func performDrop(info: DropInfo) -> Bool {
        draggedItem = nil
        return true
    }
    
    func dropEntered(info: DropInfo) {
        if let draggedItem {
            let fromIndex = exerciseList.firstIndex(of: draggedItem)
            if let fromIndex {
                let toIndex = exerciseList.firstIndex(of: destinationItem)
                if let toIndex, fromIndex != toIndex {
                    withAnimation {
                        self.exerciseList.move(fromOffsets: IndexSet(integer: fromIndex), toOffset: toIndex > fromIndex ? (toIndex + 1) : toIndex)
                    }
                }
            }
        }
    }
    
}
