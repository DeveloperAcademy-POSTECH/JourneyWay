//
//  VoiceCardPopupContents.swift
//  WheelchairRun
//
//  Created by Ayden on 2022/04/12.
//

import SwiftUI

//struct VoiceCardPopupContents {
//    var contentsArray = [Content(programName: "엘린과 아침 산책", name: "엘린 가드너", time: 10, contents: """
//            안녕하세요!
//            당신의 산책 가이드 엘린입니다.
//            아침만이 주는 '시작의 기운'을 느껴볼까요?
//            오늘 아침부터요! Ready, Set, Push!
//            """)]
//    
//    struct Content {
//        var programName: String
//        var name: String
//        var time: Int
//        var contents: String
//    }
//}
struct Record {
    var pushCount: Int
    var distance: Float
    var time: TimeInterval
}

struct ProgramName {
    static let ellin: String = "엘린과 아침 산책"
    static let kelly: String = "켈리와 긍정 러닝"
    static let leo: String   = "레오와 마음챙김 산책"
    static let dylan: String = "딜런과 기초 러닝"
}

struct VoiceMentorName {
    static let ellin: String = "엘린 가드너"
    static let kelly: String = "켈리 한"
    static let leo: String = "레오 정"
    static let dylan: String = "딜런 오브라이언"
}

struct VoiceMentorTime {
    static let ellin: Int = 10
    static let kelly: Int = 15
    static let leo: Int = 20
    static let dylan: Int = 5
}

struct VoiceMentorContents {
    static let ellin: String = """
            안녕하세요!
            당신의 산책 가이드 엘린입니다.
            아침만이 주는 '시작의 기운'을 느껴볼까요?
            오늘 아침부터요! Ready, Set, Push!
            """
    static let kelly: String = """
            안녕하세요!
            긍정 러닝 가이드 켈리입니다.
            근육과 심장이 움직일 때, 긍정도 같이 자라납니다.
            우리 같이 해봐요! Ready, Set, Push!
            """
    static let leo: String = """
            안녕하세요!
            마음챙김 명상가 레오입니다.
            산책하면서 나와 주변을 있는 그대로 알아차려볼까요?
            아주 놀라울 거에요! Ready, Set, Push!
            """
    static let dylan: String = """
            안녕하세요!
            휠체어 러닝 선수로 활동 중인 딜런입니다.
            러닝을 좀 더 쉽게, 재밌게 하도록 도와드릴게요.
            준비됐나요? Ready, Set, Push!
            """
}
