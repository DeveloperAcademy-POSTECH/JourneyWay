//
//  ProgramProgressBar.swift
//  WheelchairRun
//
//  Created by Noah Park on 2022/04/13.
//

import SwiftUI
import Combine

struct ProgramProgressBar: View {
    @ObservedObject var program: TrackingViewState
    let timer: Publishers.Autoconnect<Timer.TimerPublisher>
    let lineWidth = 15.0
    
    var body: some View {
        let duration = program.player?.duration ?? 0.0
        ZStack {
            Circle()
                .stroke(lineWidth: lineWidth)
                .opacity(0.3)
                .foregroundColor(Pallete.purple)
            Circle()
                .trim(from: 0.0, to: CGFloat(min(Float(program.progressValue) / Float(duration), 1.0)))
                .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
                .foregroundColor(Pallete.purple)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear, value: program.progressValue)
            VStack {
                Text(Program.secondsToTime(time: program.progressValue))
                    .font(.largeTitle)
                    .bold()
                    .onReceive(timer) { _ in
                        if program.player?.isPlaying != false {
                            if program.isRunning {
                                program.updateProgressValue(time: program.player?.currentTime ?? 0.0)
                                program.updateStats_test()
                            }
                        } else if program.player?.currentTime == 0.0 {
                            timer.upstream.connect().cancel()
                            program.markComplete()
                            program.player?.stop()
                        }
                    }
                Text("/ \(Program.secondsToTime(time: duration))")
                    .fontWeight(.bold)
            }
        }
        .frame(maxWidth: 300, maxHeight: 300)
    }
}
