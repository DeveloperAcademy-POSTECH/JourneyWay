//
//  DummyProgramViewModel.swift
//  WheelchairRun
//
//  Created by Noah Park on 2022/04/10.
//

import Foundation

class DummyProgramViewModel: ObservableObject {
    @Published private var model = VoiceMentor(mentorName: "Voice Walking Test",
                                                    playbackTime: 10)
    @Published var isComplete: Bool = false
    @Published var isPreparing: Bool = true
    
    var mentorName: String { model.mentorName }
    var playbackTime: TimeInterval { model.playbackTime }
    var isRunning: Bool { model.isRunning }
    var stats: VoiceMentor.ExerciseStats { model.stats }
    var progressValue: Double { model.progressValue }
    
    
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
}
