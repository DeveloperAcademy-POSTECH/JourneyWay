//
//  VoiceMentorHeaderView.swift
//  WheelchairRun
//
//  Created by Woody on 2022/04/11.
//

import SwiftUI

struct VoiceMentorHeaderView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Voice Mentor")
                    .titleFont()
                Button(action: {
                    // TODO: dismiss 로직 구현
                }) {
                    WCRXButton()
                }
            }
            Text("Select your favorite voice to listen while exercsing")
                .subTitleFont()
        }
    }
}
