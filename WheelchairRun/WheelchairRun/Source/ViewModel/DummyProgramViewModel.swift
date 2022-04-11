//
//  DummyProgramViewModel.swift
//  WheelchairRun
//
//  Created by Noah Park on 2022/04/10.
//

import Foundation
import AVFoundation

class DummyProgramViewModel: ObservableObject {
    @Published private var model = VoiceMentor(mentorName: "Voice Walking Test",
                                               playbackTime: 10, voiceString: "sample")
    @Published var isComplete: Bool = false
    @Published var isPreparing: Bool = true
    var player: AVAudioPlayer?
    
    var readyText: [String] = ["How is your condition?",
                               "Checked road safety?",
                               "Now, shall we run?"]
    
    var mentorName: String { model.mentorName }
    var isRunning: Bool { model.isRunning }
    var stats: VoiceMentor.ExerciseStats { model.stats }
    var progressValue: Double { model.progressValue }
    
    
    init() {
        player = Sound.preparePlay(soundfile: model.voiceString)
    }
    
    
    func toggleRunningStatus() {
        model.toggleRunningStatus()
    }
    
    func countSecond() {
        model.countSeconds()
    }
    
    func updateStats_test() {
        model.updateStats_test(pushUpdate: 0.6, distanceUpdate: 0.0012)
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
