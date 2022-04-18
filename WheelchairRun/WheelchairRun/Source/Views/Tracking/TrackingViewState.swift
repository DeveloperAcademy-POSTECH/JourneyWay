//
//  DummyProgramViewModel.swift
//  WheelchairRun
//
//  Created by Noah Park on 2022/04/10.
//

import Foundation
import AVFoundation
import SwiftUI
import CoreMotion

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
    
    private let activityManager = CMMotionActivityManager()
    private let pedometer = CMPedometer()

    
    var player: AVAudioPlayer?
    
    init(program: Program) {
        self.program = program
        player = Sound.preparePlay(soundfile: program.soundTrack)
        startTracking()
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
    
    func startTracking() {
      if CMPedometer.isStepCountingAvailable() {
          startCountingSteps()
      }
    }
    
    func stopTracking() {
        pedometer.stopUpdates()
    }
    
    
    private func startCountingSteps() {
        pedometer.startUpdates(from: Date()) {
          [weak self] pedometerData, error in
          guard let pedometerData = pedometerData, error == nil else { return }

          DispatchQueue.main.async {
              self?.stats.pushCount = Float(truncating: pedometerData.numberOfSteps) / 2
              self?.stats.distance = Float(truncating: pedometerData.distance ?? 0) / 1000
          }
      }
    }
}
