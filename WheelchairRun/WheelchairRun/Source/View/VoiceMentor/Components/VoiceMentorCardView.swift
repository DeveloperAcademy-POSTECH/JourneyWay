//
//  VoiceMentorView.swift
//  WheelchairRun
//
//  Created by Woody on 2022/04/08.
//

import SwiftUI

struct VoiceMentorCardView: View {
    @Binding var isPopupPresented: Bool
    
    let backgroundColor: [Color] = [
        Pallete.red,
        Pallete.yellow,
        Pallete.cardPointColor3,
        Pallete.cardPointColor4
    ]
    
    // TODO: 폰트 정리
    var body: some View {
        VStack {
            Button(action: {
                // TODO: 눌렀을 때 팝업 나오게 하기
                withAnimation {
                    isPopupPresented.toggle()
                }
                
            }) {
                backgroundColor[0]
                    .overlay {
                        VStack(alignment: .trailing, spacing: 0) {
                            VStack(alignment: .leading, spacing: 0) {
                                Text("엘린의 명상")
                                    .fontWeight(.black)
                                    .font(.system(size: 20))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Text("5 min")
                                    .font(.caption)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .foregroundColor(Pallete.white)
                            .padding([.leading,.top], 10)
                            HStack {
                                Text("🧘🏻‍♀️")
                                    .font(.system(size: 50))
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                            }
                        }
                    }
                    .cornerRadius(15)
                    .shadow(radius: 3)
                    .frame(width: 164, height: 124, alignment: .center)
            }
        }
    }
}

struct VoiceMentorCardView_Previews: PreviewProvider {
    static var previews: some View {
        VoiceMentorCardView(isPopupPresented: .constant(false))
    }
}
