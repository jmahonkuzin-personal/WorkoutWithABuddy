//
//  DraggableExample.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 10/1/24.
//

import Foundation
import SwiftUI

struct DraggableTextItem: Identifiable, Hashable {
    let id = UUID()
    var text: String
}

struct DraggableListView: View {
    @State private var items: [DraggableTextItem] = [
        DraggableTextItem(text: "Text Box 1"),
        DraggableTextItem(text: "Text Box 2"),
        DraggableTextItem(text: "Text Box 3")
    ]
    
    @State private var draggedItem: DraggableTextItem?
    
    var body: some View {
        VStack {
            List {
                ForEach(items) { item in
                    HStack {
                        Image(systemName: "line.horizontal.3") // Draggable icon
                            .foregroundColor(.gray)
                            .padding(.trailing, 8)
                        
                        Text(item.text)
                            .padding(.vertical, 8)
                            .onDrag {
                                self.draggedItem = item
                                return NSItemProvider(object: item.text as NSString)
                            }
                            .onDrop(of: [.text], delegate: DropViewDelegate(item: item, items: $items, draggedItem: $draggedItem))
                    }
                }
                .onMove(perform: move)
            }
            .listStyle(PlainListStyle())
            .environment(\.editMode, .constant(.active)) // Enable drag-to-reorder
            
            Button(action: addItem) {
                Text("Add Another Text Box")
                    .foregroundColor(.blue)
            }
            .padding()
        }
    }
    
    func addItem() {
        let newItem = DraggableTextItem(text: "Text Box \(items.count + 1)")
        items.append(newItem)
    }
    
    func move(from source: IndexSet, to destination: Int) {
        items.move(fromOffsets: source, toOffset: destination)
    }
}

struct DropViewDelegate: DropDelegate {
    let item: DraggableTextItem
    @Binding var items: [DraggableTextItem]
    @Binding var draggedItem: DraggableTextItem?
    
    func dropEntered(info: DropInfo) {
        if let draggedItem = draggedItem, draggedItem != item {
            let fromIndex = items.firstIndex(of: draggedItem)!
            let toIndex = items.firstIndex(of: item)!
            if fromIndex != toIndex {
                items.move(fromOffsets: IndexSet(integer: fromIndex), toOffset: toIndex > fromIndex ? toIndex + 1 : toIndex)
            }
        }
    }
    
    func performDrop(info: DropInfo) -> Bool {
        draggedItem = nil
        return true
    }
}

struct DraggableListView_Previews: PreviewProvider {
    static var previews: some View {
        DraggableListView()
    }
}
