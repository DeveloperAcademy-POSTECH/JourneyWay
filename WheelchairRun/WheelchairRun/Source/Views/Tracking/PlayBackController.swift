//
//  PlaybackController.swift
//  WheelchairRun
//
//  Created by Noah Park on 2022/04/13.
//

import SwiftUI

struct PlayBackController: View {
    @ObservedObject var program: TrackingViewState
    
    var body: some View {
        HStack {
            if !program.isRunning {
                Button {
                    program.isComplete = true
                    program.player?.stop()
                } label: {
                    Circle()
                        .foregroundColor(.black)
                        .overlay(Image(systemName: "stop.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25)
                            .foregroundColor(Pallete.mint))
                        .frame(width: 100, height: 100)
                        .padding()
                }
            }
            Button {
                program.toggleRunningStatus()
                if program.isRunning {
                    program.player?.play()
                } else {
                    program.player?.pause()
                }
            } label: {
                Circle()
                    .foregroundColor(.black)
                    .overlay(Image(systemName: program.isRunning ? "pause.fill" : "chevron.right")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25)
                        .foregroundColor(Pallete.mint))
                    .frame(width: 100, height: 100)
                    .padding()
                    .animation(.linear, value: program.isRunning)
            }
        }
    }
}
