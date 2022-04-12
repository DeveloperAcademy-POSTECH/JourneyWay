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
                Text("Voice Mentor")
                    .titleFont()
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    WCRXButton()
                }
            }
            Text("Select your favorite voice to listen while exercsing")
                .subTitleFont()
        }
    }
}
