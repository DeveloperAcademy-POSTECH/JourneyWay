//
//  DummyProgramViewModel.swift
//  WheelchairRun
//
//  Created by Noah Park on 2022/04/10.
//

import Foundation
import AVFoundation
import SwiftUI

struct ExerciseStats {
    var pushCount: Float = 0.0
    var distance: Float = 0.0
}

class TrackingViewState: ObservableObject {
    @Published var program: Program
    @Published var isComplete: Bool = false
    @Published var isPreparing: Bool = true
    @Published var isRunning: Bool = true
    @Published var progressValue: Double = 0.0
    @Published var stats: ExerciseStats = ExerciseStats()
    
    var player: AVAudioPlayer?
    
    
    init(program: Program) {
        self.program = program
    }
    
    func updateProgressValue(time newVal: TimeInterval) {
        self.progressValue = newVal
    }
    
    func toggleRunningStatus() {
        isRunning.toggle()
    }
    
    func markComplete() {
        isComplete = true
    }
    
    func playVoiceMentor() {
        if let player = player {
            player.play()
        }
    }
    
    func updateStats_test() {
        stats.pushCount += 0.06
        stats.distance += 0.00012
    }
}
