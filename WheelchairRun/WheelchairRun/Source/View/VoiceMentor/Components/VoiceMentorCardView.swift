//
//  VoiceMentorView.swift
//  WheelchairRun
//
//  Created by Woody on 2022/04/08.
//

import SwiftUI

struct VoiceMentorCardView: View {
    @Binding var isPopupPresented: Bool
    @Binding var selectedProgram: Program
    var program: Program
    
    // TODO: 폰트 정리
    var body: some View {
        Button(action: {
            withAnimation {
                print("press")
                isPopupPresented.toggle()
                selectedProgram = program
            }
        }) {
            program.color
                .overlay {
                    VStack(alignment: .trailing, spacing: 0) {
                        VStack(alignment: .leading, spacing: 0) {
                            Text(program.programName ?? "Undefined")
                                .cardTitle()
                            Text(program.duration + "min")
                                .cardSubTitle()
                        }
                        .padding([.leading,.top], 10)
                        HStack {
                            Text(program.emoji)
                                .font(.system(size: 50))
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                    }
                }
                .cornerRadius(15)
                .shadow(radius: 3)
                .frame(width: 164, height: 124, alignment: .center)
        }
        .buttonStyle(CardButtonStyle())
    }
}


extension Text {
    func cardTitle() -> some View {
        self.fontWeight(.black)
            .font(.title3)
            .frame(maxWidth: .infinity,
                   alignment: .leading)
            .foregroundColor(Pallete.white)
    }
    
    func cardSubTitle() -> some View {
        self.font(.caption)
            .frame(maxWidth: .infinity,
                   alignment: .leading)
            .foregroundColor(Pallete.white)
    }
}


struct VoiceMentorCardView_Previews: PreviewProvider {
    static var previews: some View {
        VoiceMentorCardView(isPopupPresented: .constant(false),
                            selectedProgram: .constant(Program.dummy[0]),
                            program: Program.dummy[0])
    }
}
