//
//  VoiceCardPopupView..swift
//  WheelchairRun
//
//  Created by Ayden on 2022/04/06.
//

import SwiftUI

//extension Color {
//    static let mainColorPurple = Color("MainColorPurple")
//    static let energeticColorGreen = Color("energeticColorGreen")
//    static let mainColorMint = Color("MainColorMint")
//}

var detailContents2 = """
            안녕하세요!
            휠체어 러닝 선수로 5년째 활동 중인 엘린입니다.
            러닝을 좀 더 쉽게, 재밌게 하도록 도와드릴게요.
            준비됐나요? Ready, Set, Go!
            """

struct VoiceCardPopupView2: View {
    
    var body: some View {
        ZStack {
            VoiceMentorView()
            VStack {
                Color.black.opacity(0.5)
            }.ignoresSafeArea()
            ModalView()
        }
        
    }
}
                

// 모달 카드 뷰
struct ModalView : View {
    var body: some View {
        ZStack {
            Color.mainColorPurple
            
            VStack {
                Image("profileImage1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .clipped()
                
                Spacer().frame(height: 30)
                
                VStack {
                    HStack(alignment: .lastTextBaseline) {
                        VStack(alignment: .leading) {
                            Text("엘린의 기초 러닝")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            Spacer().frame(height: 5)
                            Text("엘린 가드너")
                                .font(.subheadline)
                                .foregroundColor(.white)
                        }
                        Spacer()
                        HStack(alignment: .lastTextBaseline, spacing: 3) {
                            Text("⏰")
                                .font(.title3)
                                .offset(y: -3)
                            Text("5")
                                .foregroundColor(.white)
                                .font(.system(size: 35, weight: .bold))
                                .fontWeight(.heavy)
                            Text("min")
                                .foregroundColor(.white)
                                .font(.body)
                        }
                    }
                    Spacer()
                    Text(detailContents2)
                        .lineLimit(4)
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .leading)
                        .font(.callout)
                        .lineSpacing(4)
                        .foregroundColor(.white)
                    Spacer()
                }.padding([.leading, .trailing], 18)
    
                Button(action: {
                    // action
                }) {
                    Text("START!")
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(width: 290, height: 60)
                        .foregroundColor(Color.mainColorPurple)
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


struct VoiceCardPopupView2__Previews: PreviewProvider {
    static var previews: some View {
        VoiceCardPopupView2()
    }
}
