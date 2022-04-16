//
//  VoiceMentorView.swift
//  WheelchairRun
//
//  Created by Woody on 2022/04/10.
//

import SwiftUI

struct VoiceMentorView: View {
    @EnvironmentObject var store: MilgoStore
//    @Binding var selectedProgram: Program
    @Binding var recentProgram: [Program]
    private let columns: [GridItem] = [GridItem(.fixed(164), spacing: 12, alignment: .center),
                                       GridItem(.fixed(164), spacing: (UIScreen.main.bounds.width - 376) / 2, alignment: .center)]
    var isEmpty: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                VoiceMentorHeaderView()
                    .padding([.top,.leading,.trailing, .bottom], 24)
                ScrollView {
                    Text("최근 ")
                        .headLineFont()
                        .padding(.leading, 24)
                    if isEmpty {
                        EmptyRecentView()
                            .padding([.leading, .trailing], 24)
                            .frame(width: UIScreen.main.bounds.width,height: 130)
                    } else {
                        RecentVoiceMentorList(recentPrograms: $recentProgram)
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
            
            if store.state.isPopupPresented {
                Button(action: {
                    // TODO: 팝업 dismiss 액션 추가
                    withAnimation {
                        store.dispatch(.dismissPopup)
                    }
                }) {
                    Color.black.opacity(0.7)
                }
                .buttonStyle(PopupBackgroundButtonStyle())
                .animation(.easeIn(duration: 3), value: store.state.isPopupPresented)
                .ignoresSafeArea()
            }
        }
    }
}

struct VoiceMentorView_Previews: PreviewProvider {
    static var previews: some View {
        VoiceMentorView(recentProgram: .constant(Program.dummy),
                        isEmpty: false)
    }
}
