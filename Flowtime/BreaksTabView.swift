//
//  BreaksTabView.swift
//  Flowtime
//
//  Created by Guilherme on 13.07.25.
//


import SwiftUI

struct BreaksTabView: View {
    @ObservedObject var settings: AppSettings

    var body: some View {
        VStack(spacing: 12) {
            Text("Set break times based on work duration:")
                .foregroundColor(.secondary)
            
            Divider()

            Stepper(value: $settings.breakRule1_break, in: 1...60) {
                Text("Up to \(settings.breakRule1_work) min of work:")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("\(settings.breakRule1_break) min break")
            }

            Stepper(value: $settings.breakRule2_break, in: 1...60) {
                Text("Up to \(settings.breakRule2_work) min of work:")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("\(settings.breakRule2_break) min break")
            }
            
            Stepper(value: $settings.breakRule3_break, in: 1...60) {
                Text("Up to \(settings.breakRule3_work) min of work:")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("\(settings.breakRule3_break) min break")
            }

            Stepper(value: $settings.breakRule4_break, in: 1...60) {
                Text("Over \(settings.breakRule3_work) min of work:")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("\(settings.breakRule4_break) min break")
            }
            
            Spacer()
        }
        .padding(8)
    }
}
