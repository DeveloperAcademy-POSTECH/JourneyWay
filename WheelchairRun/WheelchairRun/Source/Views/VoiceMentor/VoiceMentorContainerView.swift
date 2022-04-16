//
//  VoiceMentorContainerView.swift
//  WheelchairRun
//
//  Created by Woody on 2022/04/12.
//

import SwiftUI

struct VoiceMentorContainerView: View {
    @EnvironmentObject var store: MilgoStore
//    @State var isPopupPresented: Bool = false
    //    @StateObject var selectedProgram = ProgramModel()
    @State var recentProgram: [Program] = []

    
    // TODO: isEmpty 변수 CoreData의 보이스로 수정 (가져오는 데이터 최대 5개)
    @State var isEmpty: Bool = false
    var body: some View {
        ZStack {
            VoiceMentorView(recentProgram: $recentProgram,
                            isEmpty: isEmpty)
                .popup(alignment: .center,
                       direction: .bottom,
                       content: { VoiceCardPopupView() })
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
            .popup(alignment: .center,
                   direction: .bottom,
                   content: { VoiceCardPopupView()})
    }
}
