//
//  BottomTabView.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 10/3/24.
//

import SwiftUI

struct BottomTabView: View {
    var body: some View {
        NavigationStack {
            VStack {
//                NavigationLink {
//                    StructToolbarItemGroupView()
//                } label: {
//                    Text("Hello, world!")
//                }
            }
            .toolbar {
                BottomToolbar()
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Home")
            .padding()
        }
    }
}

struct BottomToolbar2: ToolbarContent {
    var body: some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            Text("Home")
        }

        ToolbarItem(placement: .principal) {
            Image(systemName: "bus")
        }

        ToolbarItem(placement: .bottomBar) {
            HStack {
                Spacer()
                Button("Save") {
                    print("delete document")
                }.buttonStyle(.borderedProminent)
                
                Spacer()
                
                Button("Save") {
                    print("delete document")
                }.buttonStyle(.borderedProminent)
                Spacer()
            }
        }
    }
}


struct BottomTabView_preview: PreviewProvider {
    static var previews: some View {
        BottomTabView()
    }
}
