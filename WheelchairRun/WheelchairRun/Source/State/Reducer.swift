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
        newState.selectedProgram = .none
        newState.homeTrackingState = .tracking
        
    case .endTracking:
        newState.homeTrackingState = .none
        newState.selectedProgram = .none
        
    case .startWithVoice:
        // TODO: 화면 내리는 행동 미들웨어 장착해야함
        newState.isPopupPresented = false
        newState.isProgramSelected = true
        newState.homeTrackingState = .tracking
        
    case .endTrackingWithVoice:
        newState.homeTrackingState = .none
        newState.selectedProgram = .none
        
    case .showPopup(let program):
        newState.selectedProgram = program
        newState.isPopupPresented = true
        
    case .dismissPopup:
        newState.isPopupPresented = false
    
    }
    return newState
}
