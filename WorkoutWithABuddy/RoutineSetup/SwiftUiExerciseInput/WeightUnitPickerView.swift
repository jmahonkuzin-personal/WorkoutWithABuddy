//
//  WeightUnitPickerView.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 10/1/24.
//

import SwiftUI

struct WeightUnitPickerView: View {
    @Binding var selectedWeightUnit: WeightUnit

    var body: some View {
        VStack {
            Picker("Options", selection: $selectedWeightUnit) {
                ForEach(WeightUnit.allCases, id: \.self) { unit in
                    Text(unit.rawValue).tag(unit)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
        }
    }
}

struct WeightUnitPickerView_ParentView: View {
    @State private var weightUnit: WeightUnit = WeightUnit.pounds

    var body: some View {
        VStack {
            WeightUnitPickerView(selectedWeightUnit: $weightUnit)
        }
    }
}

struct SegmentedControlView_Previews: PreviewProvider {
    static var previews: some View {
        WeightUnitPickerView_ParentView()
    }
}
