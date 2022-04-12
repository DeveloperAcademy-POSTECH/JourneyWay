//
//  DummyProgramViewModel.swift
//  WheelchairRun
//
//  Created by Noah Park on 2022/04/10.
//

import Foundation
import AVFoundation
import SwiftUI


class DummyProgramState: ObservableObject {
    @Published private var model: Program
    @Published var isComplete: Bool = false
    @Published var isPreparing: Bool = true
    @Published var isRunning: Bool = true
    
    var player: AVAudioPlayer?
    var readyText: [String] = ["How is your condition?",
                               "Checked road safety?",
                               "Now, shall we run?"]
    var mentorName: String? { model.programName }
    var stats: ExerciseStats { model.stats }
    var progressValue: Double = 0.0
    
    init(programName: String?, duration: String, mentor: Program.Mentor?, description: String, color: LinearGradient, soundTrack: String?) {
        
        model = Program(programName: programName, duration: duration, mentor: mentor, description: description, color: color, soundTrack: soundTrack)
        player = Sound.preparePlay(soundfile: model.soundTrack)
    }
    
    func updateProgressValue(time newVal: TimeInterval) {
        self.progressValue = newVal
    }
    
    func toggleRunningStatus() {
        isRunning.toggle()
    }
    
    func updateStats_test() {
        model.updateStats_test(pushUpdate: 0.06, distanceUpdate: 0.00012)
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
