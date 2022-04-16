//
//  RecentVoiceMentorList.swift
//  WheelchairRun
//
//  Created by Woody on 2022/04/10.
//

import SwiftUI

struct RecentVoiceMentorList: View {
    @Binding var recentPrograms: [Program]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 12) {
                Color.clear.padding(0)
                ForEach(recentPrograms.indices, id: \.self) { id in
                    VoiceMentorCardView(program: recentPrograms[id])
                }
            }
        }
    }
}

struct RecentVoiceMentorList_Previews: PreviewProvider {
    static var previews: some View {
        RecentVoiceMentorList(recentPrograms: .constant(Program.dummy))
    }
}
