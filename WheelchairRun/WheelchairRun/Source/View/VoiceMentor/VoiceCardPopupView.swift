//
//  VoiceCardPopupView..swift
//  WheelchairRun
//
//  Created by Ayden on 2022/04/06.
//

import SwiftUI

struct VoiceCardPopupView: View {
    @State private var isShowingModal = true
    @State private var modalOpacity: Double = 1.0
    
    var body: some View {
            ModalView()
    }
}
       


struct ModalOverlay: View {
    var color = Color.black.opacity(0.4)
    var tapAction: (() -> Void)? = nil

    var body: some View {
        color.onTapGesture { self.tapAction?() }
            .ignoresSafeArea()
    }
}

// 모달 카드 뷰
struct ModalView : View {
    @Binding var isShowingModal: Bool
    @Binding var modalOpacity: Double
    
    var body: some View {
        ZStack {
            Pallete.purple
            
            // 카드
            VStack {
                Image("ellinImage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .clipped()
                
                Spacer().frame(height: 30)
                
                //
                VStack {
                    HStack(alignment: .lastTextBaseline) {
                        VStack(alignment: .leading) {
                            Text(ProgramName.ellin)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            Spacer().frame(height: 5)
                            Text(VoiceMentorName.ellin)
                                .font(.subheadline)
                                .foregroundColor(.white)
                        }
                        Spacer()
                        HStack(alignment: .lastTextBaseline, spacing: 3) {
                            Text("⏰")
                                .font(.title3)
                                .offset(y: -3)
                            Text("\(VoiceMentorTime.ellin)")
                                .foregroundColor(.white)
                                .font(.system(size: 35, weight: .bold))
                                .fontWeight(.heavy)
                            Text("min")
                                .foregroundColor(.white)
                                .font(.body)
                        }
                    }
                    Spacer()
                    HStack {
                        Text(VoiceMentorContents.ellin)
                            .lineLimit(4)
                            .multilineTextAlignment(.leading)
                            .font(.callout)
                            .lineSpacing(4)
                            .foregroundColor(.white)
                        Spacer()
                    }
                    
                    Spacer()
                }.padding([.leading, .trailing], 18)
    
                Button(action: {
                    // action
                }) {
                    Text("START!")
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(width: 290, height: 60)
                        .foregroundColor(Pallete.purple)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                }
            }
            .padding(.bottom, 25)
        }
        .frame(width: 345, height: 530)
        .opacity(modalOpacity)
        .cornerRadius(20).shadow(radius: 5)
        .animation(.linear, value: modalOpacity)
        
    }
}


struct VoiceCardPopupView__Previews: PreviewProvider {
    static var previews: some View {
        VoiceCardPopupView()
    }
}
