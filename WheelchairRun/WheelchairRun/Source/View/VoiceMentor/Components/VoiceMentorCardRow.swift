//
//  VoiceMentorCardRow.swift
//  WheelchairRun
//
//  Created by Woody on 2022/04/10.
//

import SwiftUI

struct VoiceMentorCardRow: View {
    @Binding var isPopupPresented: Bool
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            VoiceMentorCardView(isPopupPresented: $isPopupPresented)
            VoiceMentorCardView(isPopupPresented: $isPopupPresented)
        }
    }
}

struct VoiceMentorCardRow_Previews: PreviewProvider {
    static var previews: some View {
        VoiceMentorCardRow(isPopupPresented: .constant(false))
    }
}
