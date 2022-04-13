//
//  VoiceMentorContainerView.swift
//  WheelchairRun
//
//  Created by Woody on 2022/04/12.
//

import SwiftUI

struct VoiceMentorContainerView: View {
    @State var isPopupPresented: Bool = false
    @StateObject var selectedProgram = ProgramModel()
    
    var body: some View {
        ZStack {
            VoiceMentorView(isPopupPresented: $isPopupPresented,
                            selectedProgram: $selectedProgram.selectedProgram)
                .popup(isPopupPresented: $isPopupPresented,
                       alignment: .center,
                       direction: .bottom,
                       content: { VoiceCardPopupView.init(selectedProgram: $selectedProgram.selectedProgram)})
        }
        
    }
}

struct VoiceMentorContainerView_Previews: PreviewProvider {
    
    static var previews: some View {
        VoiceMentorContainerView()
            .popup(isPopupPresented: .constant(false),
                   alignment: .center,
                   direction: .bottom,
                   content: { VoiceCardPopupView.init(selectedProgram: .constant(Program.dummy[0]))})
    }
}
