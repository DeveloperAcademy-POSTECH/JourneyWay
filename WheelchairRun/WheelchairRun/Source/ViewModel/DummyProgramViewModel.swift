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
    var mentorName: String { model.mentorName }
    var playbackTime: TimeInterval { model.playbackTime }
    var isRunning: Bool { model.isRunning }
    var stats: VoiceMentor.ExerciseStats { model.stats }
    var progressValue: Double { model.progressValue }
    var isComplete: Bool { model.isComplete }
    
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
        model.markComplete()
    }
}
