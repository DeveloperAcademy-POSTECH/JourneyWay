//
//  PushNgoButton.swift
//  WheelchairRun
//
//  Created by Woody on 2022/04/18.
//

import SwiftUI

struct PushNgoButton: View {
    @EnvironmentObject var store: MilgoStore
    @State private var isPresented = false
    var body: some View {
        Spacer(minLength: 25)
        Button(action: {
            withAnimation {
                store.dispatch(.startTracking)
            }
        }) {
            ZStack{
                Image("Circle_gradation")
                    .resizable()
                    .frame(width: 220, height: 220)
                Text("Push & Go")
                    .fontWeight(.bold)
                    .font(.largeTitle)
                    .shimmering(active: true, duration: 1.7, bounce: false)
                    .foregroundColor(Color(hue: 0.454, saturation: 1.0, brightness: 0.994))
            }
        }
        .buttonStyle(PopupBackgroundButtonStyle())
        Spacer()
    }
}
