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
        if newState.homeTrackingState == .tracking {
            newState.homeTrackingState = .none
        }
        
        if newState.voicePartnerTrackingState == .tracking {
            newState.voicePartnerTrackingState = .none
            newState.isPopupPresented = false
            newState.isVoicePartnerViewPresented = false
        }
        newState.selectedProgram = .none
        
    case .startWithVoice:
        newState.voicePartnerTrackingState = .tracking
        
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
