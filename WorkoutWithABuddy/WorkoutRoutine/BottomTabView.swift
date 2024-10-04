//
//  BottomTabView.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 10/3/24.
//

import SwiftUI

struct BottomTabView: View {
    @State private var showingPopover = false

    var body: some View {
        Button("Show Menu") {
            showingPopover = true
        }
        .popover(isPresented: $showingPopover) {
            Text("Your content here")
                .font(.headline)
                .padding()
        }
    }
//    var body: some View {
//        TabView {
//            Circle()
//                .pop
//        }
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
}

#Preview {
    BottomTabView()
}
