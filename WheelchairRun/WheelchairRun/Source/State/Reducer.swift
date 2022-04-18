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
        newState.homeAppState = .tracking
        
    case .endTracking:
        if newState.homeAppState == .tracking {
            newState.homeAppState = .none
        }
        
        if newState.voicePartnerAppState == .tracking {
            newState.voicePartnerAppState = .none
            newState.isPopupPresented = false
            newState.isVoicePartnerViewPresented = false
        }
        newState.selectedProgram = .none
        
    case .startWithVoice:
        newState.voicePartnerAppState = .tracking
        
    case .presentVoicepartnerView:
        newState.isVoicePartnerViewPresented = true
        
    case .dismissVoicepartnerView:
        newState.isVoicePartnerViewPresented = false
        
    case .showPopup(let program):
        newState.selectedProgram = program
        newState.isPopupPresented = true
        
    case .dismissPopup:
        newState.isPopupPresented = false
    }
    return newState
}
