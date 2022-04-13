//
//  DummyProgramViewModel.swift
//  WheelchairRun
//
//  Created by Noah Park on 2022/04/10.
//

import Foundation
import AVFoundation
import SwiftUI


class ProgramState: ObservableObject {
    @Published var program: Program
    @Published var isComplete: Bool = false
    @Published var isPreparing: Bool = true
    @Published var isRunning: Bool = true
    
    var player: AVAudioPlayer?
    var progressValue: Double = 0.0
    
    init(program: Program) {
        self.program = program
    }
    
    func updateProgressValue(time newVal: TimeInterval) {
        self.progressValue = newVal
    }
    
    func toggleRunningStatus() {
        isRunning.toggle()
    }
    
    func updateStats_test() {
        program.updateStats_test(pushUpdate: 0.06, distanceUpdate: 0.00012)
    }
    
    func markComplete() {
        isComplete = true
    }
    
    func playVoiceMentor() {
        if let player = player {
            player.play()
        }
    }
}
