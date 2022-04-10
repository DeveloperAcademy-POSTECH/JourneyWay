//
//  RecentVoiceMentorList.swift
//  WheelchairRun
//
//  Created by Woody on 2022/04/10.
//

import SwiftUI

struct RecentVoiceMentorList: View {
    
    // TODO: 폰트 수정
    var body: some View {
        VStack {
            Text("Recent")
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 25))
                .padding(.leading, 24)
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 12) {
                    Color.clear.padding(0)
                    ForEach(1..<100) { _ in
                        VoiceMentorCardView()
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 130)
        }
        
    }
}

struct RecentVoiceMentorList_Previews: PreviewProvider {
    static var previews: some View {
        RecentVoiceMentorList()
    }
}
