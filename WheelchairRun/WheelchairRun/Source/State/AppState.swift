//
//  State.swift
//  WheelchairRun
//
//  Created by Woody on 2022/04/16.
//

import Foundation

/// 앱 상태
///
/// 트래킹이 주된 앱이다보니 크게 트래킹 상태와 트래킹중이 아닌 상태 두개로 나누었어요.
enum AppState {
    case none           // 트래킹과 관련하여 어떤 상태도 아님
    case tracking
}

/// 트래킹 상태
///
/// 트래킹 중일 때 단계를 네가지로 나누어서 상태를 관리해요.
enum TrackingState {
    case start
    case pushing
    case pause
    case complete
}
