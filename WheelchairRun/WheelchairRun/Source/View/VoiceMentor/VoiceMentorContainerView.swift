//
//  VoiceMentorContainerView.swift
//  WheelchairRun
//
//  Created by Woody on 2022/04/12.
//

import SwiftUI

struct VoiceMentorContainerView: View {
    @State var isPopupPresented: Bool = false
    
    var body: some View {
        ZStack {
            VoiceMentorView(isPopupPresented: $isPopupPresented)
                .popup(isPopupPresented: $isPopupPresented,
                       alignment: .center,
                       direction: .bottom,
                       content: { VoiceCardPopupView2.init()})
        }
    }
}
