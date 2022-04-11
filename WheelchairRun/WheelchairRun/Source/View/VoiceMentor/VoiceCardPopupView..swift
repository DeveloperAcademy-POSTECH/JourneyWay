//
//  VoiceCardPopupView..swift
//  WheelchairRun
//
//  Created by Ayden on 2022/04/06.
//

import SwiftUI

extension Color {
    static let mainColorPurple = Color("MainColorPurple")
    static let energeticColorGreen = Color("energeticColorGreen")
    static let mainColorMint = Color("MainColorMint")
}


struct VoiceCardPopupView: View {
    var detailContents = """
                안녕하세요!
                휠체어 러닝 선수로 5년째 활동 중인 엘린입니다.
                러닝을 좀 더 쉽게, 재밌게 하도록 도와드릴게요.
                부담 없이 하루에 딱 5분만 해보는 건 어떨까요?
                몸도 마음도 상쾌해지는 기분 좋은 5분 러닝.
                준비됐나요? Ready, Set, Go!
                """
    
    var body: some View {
        ZStack {
            Color.mainColorPurple
            VStack() {
                ZStack {
                    Text("Voice Mentor")
                        .font(.callout)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                    HStack {
                        Spacer()
                        Button(action: {
                            
                        }) { Image(systemName: "xmark")
                                .imageScale(.medium)
                                .foregroundColor(.white)
                        }
                    }
                }
                
                Spacer().frame(height: 20)
                Group {
                    HStack {
                        Image(systemName: "person.crop.circle.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 60, weight: .regular))

                        VStack(alignment: .leading) {
                            Text("엘린의 기초 5분 러닝")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            Spacer().frame(height: 5)
                            Text("엘린 가드너")
                                .font(.footnote)
                                .foregroundColor(.white)
                        }
                    }.frame(width: 290, alignment: .leading)
                }
                
                Spacer()
//                Group {
//                    Spacer().frame(height: 20)
//                    RoundedRectangle(cornerRadius: 30)
//                        .frame(height: 1)
//                        .foregroundColor(.white)
//                    Spacer()
//                }
                
                ProgramContents(contents: detailContents)
                
                Button(action: {
                    // action
                }) { Text("Start!")
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(width: 150, height: 60)
                        .foregroundColor(Color.mainColorPurple)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                }
            }.padding()
        }
        .frame(width: 330, height: 520)
        .cornerRadius(20).shadow(radius: 5)
    }
}


struct ProgramContents: View {
    
    let contents: String
    
    var body: some View {
        Text(contents)
            .lineLimit(6)
            .multilineTextAlignment(.leading)
            .frame(width: 290, height: 130, alignment: .leading)
            .font(.subheadline)
            .lineSpacing(4)
            .foregroundColor(.white)
        Spacer()
        HStack(alignment: .bottom) {
            Text("5")
                .foregroundColor(.white)
                .font(.system(size: 60, weight: .regular))
            Text("min")
                .foregroundColor(.white)
                .padding(.bottom)
                .font(.body)
        }
    }
}

struct VoiceCardPopupView__Previews: PreviewProvider {
    static var previews: some View {
        VoiceCardPopupView()
    }
}
