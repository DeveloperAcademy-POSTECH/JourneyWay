//
//  VoiceMentorView.swift
//  WheelchairRun
//
//  Created by Woody on 2022/04/10.
//

import SwiftUI

struct VoiceMentorView: View {
    @Binding var isPopupPresented: Bool

    var body: some View {
        ZStack {
            VStack {
                VoiceMentorHeaderView()
                    .padding([.top,.leading,.trailing, .bottom], 24)
                ScrollView {
                    Text("Recent")
                        .headLineFont()
                        .padding(.leading, 24)
                    RecentVoiceMentorList(isPopupPresented: $isPopupPresented)
                        .frame(width: UIScreen.main.bounds.width,
                               height: 130)
                    Text("New")
                        .headLineFont()
                        .padding([.leading,], 24)
                    ForEach(0..<10) { _ in
                        VoiceMentorCardRow(isPopupPresented: $isPopupPresented)
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
        VoiceMentorView(isPopupPresented: .constant(false))
    }
}
