//
//  Reducer.swift
//  WheelchairRun
//
//  Created by Woody on 2022/04/16.
//

import Foundation

typealias Reducer<State, Action> = (State, Action) -> State

let milgoReducer: Reducer<MilgoState, MilgoAction> = { state, action in
    var newState = state
    
    switch action {
    case .startTracking:
        newState.trackingState = .tracking
    case .endTracking:
        newState.trackingState = .none
    }
    return newState
}
