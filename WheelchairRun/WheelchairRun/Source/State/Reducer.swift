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
        newState.selectedProgram = Program.none
        newState.trackingState = .none
    case .startWithVoice(let program):
        // TODO: selectedProgram에 다시 업데이트는 필요없다. 필요한 건, 화면 내리는 행동.ㅠ
        newState.selectedProgram = program
        newState.trackingState = .tracking
    case .showPopup(let program):
        newState.selectedProgram = program
        newState.isPopupPresented = true
    case .dismissPopup:
        newState.isPopupPresented = false
    }
    return newState
}
