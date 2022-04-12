//
//  VoiceMentorContainerView.swift
//  WheelchairRun
//
//  Created by Woody on 2022/04/12.
//

import SwiftUI

struct VoiceMentorContainerView: View {
    @State var isPopupPresented: Bool = false
    var program: Program?
    
    var body: some View {
        ZStack {
            VoiceMentorView(isPopupPresented: $isPopupPresented)
                .popup(isPopupPresented: $isPopupPresented,
                       alignment: .center,
                       direction: .bottom,
                       content: { VoiceCardPopupView.init()})
        }
        
    }
}

struct VoiceMentorContainerView_Previews: PreviewProvider {
    
    static var previews: some View {
        VoiceMentorContainerView()
            .popup(isPopupPresented: .constant(false),
                   alignment: .center,
                   direction: .bottom,
                   content: { VoiceCardPopupView.init(program: Program.dummy[0])})
    }
}
