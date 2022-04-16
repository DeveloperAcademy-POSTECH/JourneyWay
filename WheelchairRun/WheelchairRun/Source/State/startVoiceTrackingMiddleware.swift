//
//  DismissModalMiddleware.swift
//  WheelchairRun
//
//  Created by Woody on 2022/04/17.
//

import Combine
import SwiftUI

let startVoiceTrackingMiddleware: Middleware<MilgoStore, MilgoAction> = { state, action in
//    
//    switch action {
//    case .startWithVoice:
//        return Just(.startTracking)
//            .delay(for: 2, scheduler: DispatchQueue.main).eraseToAnyPublisher()
//    default:
//        break
//    }
    
    return Empty().eraseToAnyPublisher()
}

