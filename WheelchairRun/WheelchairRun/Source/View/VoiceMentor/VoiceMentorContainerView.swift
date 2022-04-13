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
    
    // TODO: isEmpty 변수 CoreData의 보이스로 수정 (가져오는 데이터 최대 5개)
    private var isEmpty: Bool = true
    var body: some View {
        ZStack {
            VoiceMentorView(isPopupPresented: $isPopupPresented,
                            selectedProgram: $selectedProgram.selectedProgram,
                            isEmpty: isEmpty)
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
