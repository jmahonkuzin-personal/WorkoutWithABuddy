//
//  EditableListExample.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 10/1/24.
//

import Foundation
import SwiftUI

struct ListItem: Identifiable {
    let id = UUID()
    var text: String
}

struct EditableListView: View {
    @State private var items: [ListItem] = [
            ListItem(text: "Item 1"),
            ListItem(text: "Item 2"),
            ListItem(text: "Item 3")
        ]

    var body: some View {
        VStack {
            List {
                ForEach($items) { $item in
                    TextField("Item", text: $item.text)
                }
                .onMove(perform: move)
            }
            .environment(\.editMode, .constant(.active))
        }
    }

    func move(from source: IndexSet, to destination: Int) {
        items.move(fromOffsets: source, toOffset: destination)
    }
}
