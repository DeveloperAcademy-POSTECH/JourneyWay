//
//  WithVoiceMentorButton.swift
//  WheelchairRun
//
//  Created by Woody on 2022/04/18.
//

import SwiftUI

struct WithVoiceMentorButton: View {
    @EnvironmentObject var store: MilgoStore
    
    var body: some View {
        Button(action: {
            store.dispatch(.presentVoicepartnerView)
        }) {
            Text("보이스 파트너와 함께하기")
                .font(.body)
                .fontWeight(.bold)
                .foregroundColor(Color(red: 0.431, green: 0.995, blue: 0.838))
                .background( Image("with_voice_mentor_background")
                    .resizable()
                    .frame(width: 230, height: 50))
        }
        .padding(.vertical, 50)
        .fullScreenCover(isPresented: $store.state.isVoicePartnerViewPresented,
                         content: { VoicePartnerContentView() })
        
    }
}
