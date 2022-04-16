//
//  Action.swift
//  WheelchairRun
//
//  Created by Woody on 2022/04/16.
//

import Foundation

enum MilgoAction {
    // MARK: Home
    case startTracking              // 프로그램 없이 트래킹 시작
    case endTracking
    
    // MARK: Voice Partner
    case startWithVoice             // 프로그램 있이 트래킹 시작
    case endTrackingWithVoice
    case showPopup(Program)
    case dismissPopup
}
