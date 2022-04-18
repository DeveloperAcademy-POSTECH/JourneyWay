//
//  VoiceMentorView.swift
//  WheelchairRun
//
//  Created by Woody on 2022/04/10.
//

import SwiftUI

struct VoiceMentorView: View {
    @EnvironmentObject var store: MilgoStore
    // FIXME: 레이아웃 수정
    private let columns: [GridItem] = [GridItem(.fixed(164), spacing: 12, alignment: .center),
                                       GridItem(.fixed(164), spacing: (UIScreen.main.bounds.width - 376) / 2, alignment: .center)]
    
    var body: some View {
        ZStack {
            VStack {
                VoiceMentorHeaderView()
                    .padding([.top,.leading,.trailing, .bottom], 24)
                ScrollView {
                    Text("최근")
                        .headLineFont()
                        .padding(.leading, 24)
                    if store.state.recentPrograms.isEmpty {
                        EmptyRecentView()
                            .padding([.leading, .trailing], 24)
                            .frame(width: UIScreen.main.bounds.width,height: 130)
                    } else {
                        RecentVoiceMentorList()
                            .frame(width: UIScreen.main.bounds.width,height: 130)
                    }
                    
                    Text("새로운")
                        .headLineFont()
                        .padding([.leading,], 24)
                    LazyVGrid(columns: columns, alignment: .leading, spacing: 18) {
                        ForEach(Program.dummy.indices, id: \.self) { id in
                            VoiceMentorCardView(program: Program.dummy[id])
                        }
                    }
                    .padding(.leading, 24)
                }
            }
            
            Button(action: {
                withAnimation {
                    store.dispatch(.dismissPopup)
                }
            }) {
                Color.black.opacity(store.state.isPopupPresented ? 0.7 : 0)
            }
            .buttonStyle(PopupBackgroundButtonStyle())
            .ignoresSafeArea()
            .popup(alignment: .center,
                   direction: .bottom,
                   content: { VoiceCardPopupView() })
            
        }
    }
}

struct VoiceMentorView_Previews: PreviewProvider {
    static var previews: some View {
        VoiceMentorView()
    }
}
