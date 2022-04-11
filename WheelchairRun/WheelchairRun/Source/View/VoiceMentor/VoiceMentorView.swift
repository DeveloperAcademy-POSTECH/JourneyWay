//
//  VoiceMentorView.swift
//  WheelchairRun
//
//  Created by Woody on 2022/04/10.
//

import SwiftUI

struct PopupView: View {
    @State var isPopupPresented: Bool = false
    
    var body: some View {
        ZStack {
            VoiceMentorView(isPopupPresented: $isPopupPresented)
                .modifier(Popup(isPopupPresented: $isPopupPresented,
                                alignment: .center,
                                direction: .bottom,
                                content: {VoiceCardPopupView2.init()}))
        }
    }
}

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
                    withAnimation {
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

struct PopupBackgroundButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
      configuration.label
        .opacity(1)
    }
}

struct VoiceMentorView_Previews: PreviewProvider {
    static var previews: some View {
        VoiceMentorView(isPopupPresented: .constant(false))
    }
}
