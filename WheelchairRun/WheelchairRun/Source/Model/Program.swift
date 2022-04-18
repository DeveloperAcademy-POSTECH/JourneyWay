//
//  VoiceMentor.swift
//  WheelchairRun
//
//  Created by Noah Park on 2022/04/10.
//

import Foundation
import SwiftUI

struct Program {
    let programName: String?
    let duration: String
    var mentor: Mentor?
    var description: String
    var color: LinearGradient
    var soundTrack: String?
    var emoji: String
    
    static func secondsToTime(time: TimeInterval) -> String {
        let timeVal = Int(time)
        let (h,m,s) = (timeVal / 3600, (timeVal % 3600) / 60, (timeVal % 3600) % 60)
        let h_string = h < 10 ? "0\(h)" : "\(h)"
        let m_string =  m < 10 ? "0\(m)" : "\(m)"
        let s_string =  s < 10 ? "0\(s)" : "\(s)"
        
        return "\(h_string):\(m_string):\(s_string)"
    }
    
    static func secondsToHour(time: TimeInterval) -> String {
        let timeVal = Int(time)
        let h = timeVal / 3600
        let h_string = h < 10 ? "0\(h)" : "\(h)"
        
        return "\(h_string)"
    }
    
    static func secondsToMinute(time: TimeInterval) -> String {
        let timeVal = Int(time)
        let m = (timeVal % 3600) / 60
        let m_string =  m < 10 ? "0\(m)" : "\(m)"
        
        return "\(m_string)"
    }
    
    static func secondsToSecond(time: TimeInterval) -> String {
        let timeVal = Int(time)
        let s = (timeVal % 3600) % 60
        let s_string =  s < 10 ? "0\(s)" : "\(s)"
        
        return "\(s_string)"
    }
    
    struct Mentor {
        var name: String
        var photo: String
        
    }
    
    static let dummy: [Program] = [
        Program(programName: "엘린과 아침 산책",
                duration: "10", mentor: Mentor(name: "엘린 가드너",
                                               photo: "ellinImage"),
                description: """
                안녕하세요!
                당신의 산책 파트너 엘린입니다.
                아침만이 주는 '시작의 기운'을 느껴볼까요?
                오늘 아침부터요! Ready, Set, Push!
                """,
                color: Pallete.Gradient.purple,
                soundTrack: "Ayden",
                emoji: "☀️"),
        Program(programName: "켈리와 긍정 러닝",
                duration: "10", mentor: Mentor(name: "켈리 한",
                                               photo: "kellyImage"),
                description: """
                안녕하세요!
                긍정 러닝 파트너 켈리입니다.
                근육과 심장이 움직일 때, 긍정도 같이 자라요.
                우리 같이 해봐요! Ready, Set, Push!
                """,
                color: Pallete.Gradient.green,
                soundTrack: "Ayden",
               emoji: "🔥"),
        Program(programName: "잭과 기초 산책",
                duration: "15", mentor: Mentor(name: "잭 전",
                                              photo: "leoImage"),
                description: """
                안녕하세요!
                명상 산책 파트너 잭입니다.
                산책하며 나와 주변을 있는 그대로 느껴보세요.
                아주 놀라울 거에요! Ready, Set, Push!
                """,
                color: Pallete.Gradient.red,
                soundTrack: "Jack",
               emoji: "🧘"),
        Program(programName: "요셉과 기초 러닝",
                duration: "5", mentor: Mentor(name: "요셉 오브라이언",
                                              photo: "dylanImage"),
                description: """
                안녕하세요!
                휠체어 러닝 선수로 활동 중인 요셉입니다.
                러닝을 좀 더 쉽게, 재밌게 하도록 도와드릴게요.
                준비됐나요? Ready, Set, Push!
                """,
                color: Pallete.Gradient.blue,
                soundTrack: "Yosep",
               emoji: "💪"),
        ]
    
    static let none: Program = Program(programName: nil,
                                            duration: "",
                                            description: "",
                                            color: Pallete.noProgramColor,
                                            emoji: "")
    
}
