//
//  VoiceMentorContainerView.swift
//  WheelchairRun
//
//  Created by Woody on 2022/04/12.
//

import SwiftUI

struct VoiceMentorContainerView: View {
    @State var isPopupPresented: Bool = false
    @State var recentProgram: [Program] = []
    @StateObject var selectedProgram = ProgramModel()
    
    // TODO: isEmpty 변수 CoreData의 보이스로 수정 (가져오는 데이터 최대 5개)
    @State var isEmpty: Bool = false
    var body: some View {
        ZStack {
            VoiceMentorView(isPopupPresented: $isPopupPresented,
                            selectedProgram: $selectedProgram.selectedProgram,
                            recentProgram: $recentProgram,
                            isEmpty: isEmpty)
                .popup(isPopupPresented: $isPopupPresented,
                       alignment: .center,
                       direction: .bottom,
                       content: { VoiceCardPopupView.init(selectedProgram: $selectedProgram.selectedProgram)})
                .onAppear() {
                    // TODO: 코어데이터에서 recent데이터 가져오기
                    isEmpty = recentProgram.isEmpty
                }
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
