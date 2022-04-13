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
    
    static func secondsToTime(time: TimeInterval) -> String {
        let timeVal = Int(time)
        let (h,m,s) = (timeVal / 3600, (timeVal % 3600) / 60, (timeVal % 3600) % 60)
        let h_string = h < 10 ? "0\(h)" : "\(h)"
        let m_string =  m < 10 ? "0\(m)" : "\(m)"
        let s_string =  s < 10 ? "0\(s)" : "\(s)"
        
        return "\(h_string):\(m_string):\(s_string)"
    }
    
    struct Mentor {
        var name: String
        var photo: String
        
    }
    
    static let dummy: [Program] = [
        Program(programName: "엘린과 아침 산책",
                duration: "10", mentor: Mentor(name: "엘린 가드너",
                                               photo: ""),
                description: """
                안녕하세요!
                당신의 산책 가이드 엘린입니다.
                아침만이 주는 '시작의 기운'을 느껴볼까요?
                오늘 아침부터요! Ready, Set, Push!
                """,
                color: Pallete.Gradient.purple,
                soundTrack: "sample"),
        Program(programName: "켈리와 긍정 러닝",
                duration: "15", mentor: Mentor(name: "켈리 한",
                                               photo: ""),
                description: """
                안녕하세요!
                긍정 러닝 가이드 켈리입니다.
                근육과 심장이 움직일 때, 긍정도 같이 자라납니다.
                우리 같이 해봐요! Ready, Set, Push!
                """,
                color: Pallete.Gradient.green,
                soundTrack: nil),
        Program(programName: "레오와 마음챙김 산책닝",
                duration: "5", mentor: Mentor(name: "레오 정",
                                              photo: ""),
                description: """
                안녕하세요!
                마음챙김 명상가 레오입니다.
                산책하면서 나와 주변을 있는 그대로 알아차려볼까요?
                아주 놀라울 거에요! Ready, Set, Push!
                """,
                color: Pallete.Gradient.red,
                soundTrack: ""),
        Program(programName: "딜런과 기초 러닝",
                duration: "5", mentor: Mentor(name: "딜런 오브라이언",
                                              photo: ""),
                description: """
                안녕하세요!
                휠체어 러닝 선수로 활동 중인 딜런입니다.
                러닝을 좀 더 쉽게, 재밌게 하도록 도와드릴게요.
                준비됐나요? Ready, Set, Push!
                """,
                color: Pallete.Gradient.blue,
                soundTrack: ""),
        ]
    
}
