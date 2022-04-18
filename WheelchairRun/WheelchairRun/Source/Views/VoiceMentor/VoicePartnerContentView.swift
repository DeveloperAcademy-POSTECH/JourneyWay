//
//  VoicePartnerContentView.swift
//  WheelchairRun
//
//  Created by Woody on 2022/04/17.
//

import SwiftUI

struct VoicePartnerContentView: View {
    @EnvironmentObject var store: MilgoStore
    var body: some View {
        switch store.state.voicePartnerAppState {
        case .none:
            VoiceMentorView()
        case .tracking:
            TrackingView(program: .init(program: store.state.selectedProgram))
        }
    }
}

struct VoicePartnerContentView_Previews: PreviewProvider {
    static var previews: some View {
        VoicePartnerContentView()
    }
}
