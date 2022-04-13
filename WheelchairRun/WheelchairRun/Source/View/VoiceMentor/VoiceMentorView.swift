//
//  VoiceMentorView.swift
//  WheelchairRun
//
//  Created by Woody on 2022/04/10.
//

import SwiftUI

struct VoiceMentorView: View {
    @Binding var isPopupPresented: Bool
    @Binding var selectedProgram: Program
    private let columns: [GridItem] = [GridItem(.flexible(), spacing: 12, alignment: .trailing),
                                       GridItem(.flexible(), spacing: 12, alignment: .leading)]
    var isEmpty: Bool = true
    
    var body: some View {
        ZStack {
            VStack {
                VoiceMentorHeaderView()
                    .padding([.top,.leading,.trailing, .bottom], 24)
                ScrollView {
                    Text("Recent")
                        .headLineFont()
                        .padding(.leading, 24)
                    if isEmpty {
                        EmptyRecentView()
                            .padding([.leading, .trailing], 24)
                            .frame(width: UIScreen.main.bounds.width,height: 130)
                    } else {
                        RecentVoiceMentorList(isPopupPresented: $isPopupPresented,
                                              selectedProgram: $selectedProgram)
                        .frame(width: UIScreen.main.bounds.width,height: 130)
                    }
                    
                    Text("New")
                        .headLineFont()
                        .padding([.leading,], 24)
                    LazyVGrid(columns: columns, alignment: .leading, spacing: 12) {
                        ForEach(Program.dummy.indices, id: \.self) { id in
                            VoiceMentorCardView(isPopupPresented: $isPopupPresented,
                                                selectedProgram: $selectedProgram,
                                                program: Program.dummy[id])
                        }
                    }
                }
            }
            
            if isPopupPresented {
                Button(action: {
                    withAnimation(.easeOut(duration: 0.4)) {
                        isPopupPresented.toggle()
                    }
                }) {
                    Color.black.opacity(0.7)
                }
                .buttonStyle(PopupBackgroundButtonStyle())
                .animation(.easeIn(duration: 3), value: isPopupPresented)
                .ignoresSafeArea()
            }
        }
    }
}

struct VoiceMentorView_Previews: PreviewProvider {
    static var previews: some View {
        VoiceMentorView(isPopupPresented: .constant(false),
                        selectedProgram: .constant(Program.dummy[0]),
                        isEmpty: true)
    }
}
