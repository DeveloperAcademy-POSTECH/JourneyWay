//
//  VoiceMentor.swift
//  WheelchairRun
//
//  Created by Noah Park on 2022/04/10.
//

import Foundation

struct VoiceMentor {
    let mentorName: String
    let playbackTime: TimeInterval
    var isRunning: Bool = true
    var progressValue: Double = 0.0
    var stats: ExerciseStats = ExerciseStats()
    var voiceString: String
    
    static func secondsToTime(time: TimeInterval) -> String {
        let timeVal = Int(time)
        let (h,m,s) = (timeVal / 3600, (timeVal % 3600) / 60, (timeVal % 3600) % 60)
        let h_string = h < 10 ? "0\(h)" : "\(h)"
        let m_string =  m < 10 ? "0\(m)" : "\(m)"
        let s_string =  s < 10 ? "0\(s)" : "\(s)"
        
        return "\(h_string):\(m_string):\(s_string)"
    }
    
    mutating func toggleRunningStatus() {
        isRunning.toggle()
    }
    
    mutating func countSeconds() {
        progressValue += 0.1
    }
    
    mutating func updateStats_test(pushUpdate: Float, distanceUpdate: Float) {
        stats.pushCount += pushUpdate
        stats.distance += distanceUpdate
    }
    
    struct ExerciseStats {
        var pushCount: Float = 0.0
        var distance: Float = 0.0
    }
}
