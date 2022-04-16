//
//  ContentView.swift
//  Statistic_Temp
//
//  Created by seojeon22 on 2022/04/08.
//

import SwiftUI

// var contents = ["4월 2일", "4월 1일", "3월 31일", "3월 30일", "3월 29일", "3월 28일", "3월 27일"]

struct StatisticMainView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: StatisticTabView()) {
                    Text("통계 보러가기")
                }.navigationBarBackButtonHidden(true)
            }
        }
    }
}

struct StatisticTabView: View {
    var body: some View {
        TabView {
            HealthGraphView()
            PushDiaryView()
        }.tabViewStyle(.page(indexDisplayMode: .always))
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            .navigationTitle("통계")
            .navigationBarTitleDisplayMode(.inline)
            .padding([.leading, .trailing], 12)
    }
}

struct StatisticMainView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticMainView()
    }
}
