//
//  Action.swift
//  WheelchairRun
//
//  Created by Woody on 2022/04/16.
//

import Foundation

enum MilgoAction {
    case startTracking              // 프로그램 없이 트래킹 시작
    case startWithVoice(Program)    // 프로그램 있이 트래킹 시작
    case endTracking
    
    case showPopup(Program)
    case dismissPopup
}
