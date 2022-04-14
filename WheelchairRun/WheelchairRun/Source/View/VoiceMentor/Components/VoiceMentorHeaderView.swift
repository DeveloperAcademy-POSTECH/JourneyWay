//
//  VoiceMentorHeaderView.swift
//  WheelchairRun
//
//  Created by Woody on 2022/04/11.
//

import SwiftUI

struct VoiceMentorHeaderView: View {
    @Environment(\.presentationMode) private var presentationMode

    var body: some View {
        VStack {
            HStack {
                Text("보이스 파트너")
                    .titleFont()
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    WCRXButton()
                }
            }
            Text("운동을 함께할 보이스를 선택해주세요.")
                .subTitleFont()
        }
    }
}
