//
//  InfoModule.swift
//  WheelchairRun
//
//  Created by Noah Park on 2022/04/13.
//

import SwiftUI

struct StatsInfoModule: View {
    @ObservedObject var program: TrackingViewState
    
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Text(String(format: "%.2f", program.stats.distance))
                    .font(.title)
                    .fontWeight(.bold)
                Text("KM")
                    .font(.caption)
            }.frame(width: 100)
            Spacer()
            VStack {
                Text(String(format: "%d", Int(program.stats.pushCount)))
                    .font(.title)
                    .fontWeight(.bold)
                Text("Push")
                    .font(.caption)
            }.frame(width: 100)
            Spacer()
        }
    }
}
