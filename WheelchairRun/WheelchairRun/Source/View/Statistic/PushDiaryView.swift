//
//  PushDiaryView.swift
//  WheelchairRun
//
//  Created by JiwKang on 2022/04/12.
//

import SwiftUI

struct PushDiaryView: View {
    let diarys: [DiaryData] = DiaryData.sampleData
    var currentYear: Int = 2022
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("푸쉬 다이어리")
                .font(.custom("Apple SD Gothic Neo Light", size: 22)).bold()
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
            
            Text("매일 매일 운동 기록을 채워보세요!")
                .font(.custom("Apple SD Gothic Neo Light", size: 15))
                .padding(EdgeInsets(top: 0, leading: 11, bottom: 0, trailing: 0))
            
            ScrollView {
                LazyVStack(pinnedViews: [.sectionHeaders]) {
                    Section(header: Header(currentYear: String(currentYear))) {
                        ForEach(0..<diarys.count, id: \.self) { index in
                            DiaryList(diary: diarys[index])
                            Spacer()
                        }
                    }
                }
            }.clipped()
        }.navigationTitle("통계")
            .navigationBarTitleDisplayMode(.inline)
            .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
    }
}

struct Header: View {
    var currentYear: String
    var body: some View {
        VStack {
            Spacer()
            Text("\(currentYear)년")
                .fontWeight(.bold)
            Spacer()
            Divider()
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .frame(height: 40)
        .background(Rectangle().foregroundColor(.white).opacity(0.7))
    }
}

struct PushDiaryView_Previews: PreviewProvider {
    static var previews: some View {
        PushDiaryView()
    }
}
