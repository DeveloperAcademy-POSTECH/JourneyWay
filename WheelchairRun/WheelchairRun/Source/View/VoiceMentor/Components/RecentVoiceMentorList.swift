//
//  RecentVoiceMentorList.swift
//  WheelchairRun
//
//  Created by Woody on 2022/04/10.
//

import SwiftUI

struct RecentVoiceMentorList: View {
    @Binding var isPopupPresented: Bool

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 12) {
                Color.clear.padding(0)
                ForEach(1..<10) { _ in
                    VoiceMentorCardView(isPopupPresented: $isPopupPresented, program: Program.dummy[0])
                }
            }
        }
    }
}

struct RecentVoiceMentorList_Previews: PreviewProvider {
    static var previews: some View {
        RecentVoiceMentorList(isPopupPresented: .constant(false))
    }
}
