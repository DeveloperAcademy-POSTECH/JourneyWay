//
//  VoiceCardPopupView..swift
//  WheelchairRun
//
//  Created by Ayden on 2022/04/06.
//

import SwiftUI

struct VoiceCardPopupView: View {

    var body: some View {
        ModalView()
    }
}

// 모달 카드 뷰
struct ModalView : View {
    @EnvironmentObject var store: MilgoStore

    var body: some View {
        ZStack {
            store.state.selectedProgram.color
            
            // 카드
            VStack {
                Image(store.state.selectedProgram.mentor?.photo ?? "ellinImage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .clipped()
                
                Spacer().frame(height: 30)
                
                VStack {
                    // 프로그램, 강사, 시간
                    HStack(alignment: .lastTextBaseline) {
                        VStack(alignment: .leading) {
                            Text(store.state.selectedProgram.programName ?? "")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            Spacer().frame(height: 5)
                            Text(store.state.selectedProgram.mentor?.name ?? "")
                                .font(.subheadline)
                                .foregroundColor(.white)
                        }
                        Spacer()
                        HStack(alignment: .lastTextBaseline, spacing: 3) {
                            Text("⏰")
                                .font(.title3)
                                .offset(y: -3)
                            Text("\(store.state.selectedProgram.duration)")
                                .foregroundColor(.white)
                                .font(.system(size: 35, weight: .bold))
                                .fontWeight(.heavy)
                            Text("min")
                                .foregroundColor(.white)
                                .font(.body)
                        }
                    }
                    Spacer()
                    // 프로그램 설명
                    HStack {
                        Text(store.state.selectedProgram.description)
                            .lineLimit(4)
                            .multilineTextAlignment(.leading)
                            .font(.callout)
                            .lineSpacing(4)
                            .foregroundColor(.white)
                        Spacer()
                    }
                    
                    Spacer()
                }.padding([.leading, .trailing], 18)
    
                // start 버튼
                Button(action: {
                    UIView.setAnimationsEnabled(false)
                    store.isVoicePartnerPresented = false
            
//                    store.dispatch(.startWithVoice)
                }) {
                    Text("START!")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundLinearGradient(gradient: store.state.selectedProgram.color)
                        .frame(width: 290, height: 60)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                }
            }
            .padding(.bottom, 25)
        }
        .frame(width: 345, height: 530)
        .cornerRadius(20).shadow(radius: 5)
        
    }
}


struct VoiceCardPopupView__Previews: PreviewProvider {
    static var previews: some View {
        VoiceCardPopupView()
    }
}
