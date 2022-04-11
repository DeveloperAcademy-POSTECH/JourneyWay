//
//  ContentView.swift
//  Statistic_Temp
//
//  Created by seojeon22 on 2022/04/08.
//

import SwiftUI

var contents = ["4월 2일", "4월 1일", "3월 31일", "3월 30일", "3월 29일", "3월 28일", "3월 27일"]

struct ContentView: View {
    var body: some View {
            HomeView()
    }
}

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: StatisticTabView())
                {
                    Text("통계 보러가기")
                }.navigationBarBackButtonHidden(true)
            }
        }
    }
}

struct StatisticTabView: View {
    var body: some View {
        TabView {
            StatisticView()
            StatisticView2()
        }.tabViewStyle(.page(indexDisplayMode: .always))
            .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

struct StatisticView: View {
    var body: some View {
        
            VStack(alignment: .leading) {
                
                Text("건강기록")
                    .font(.custom("Apple SD Gothic Neo Light", size: 18)).bold()
                    .padding(EdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 0))
                
                Text("일, 주, 월 단위의 건강데이터 평균을 비교해 볼 수 있습니다.")
                    .font(.custom("Apple SD Gothic Neo Light", size: 12))
                    .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0))
                
                Divider()
                
                Spacer()
                Divider()
                
                Text("어제의 나와 대결하기")
                    .font(.custom("Apple SD Gothic Neo Light", size: 18)).bold()
                    .padding(EdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 0))
                
                Text("더 건강해지기 위한 대결! 어제의 나에게 승리해보세요!")
                    .font(.custom("Apple SD Gothic Neo Light", size: 12))
                    .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0))
                
                Divider()
                
                Spacer()
            }.navigationTitle("통계")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct StatisticView2: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("푸쉬 다이어리")
                .font(.custom("Apple SD Gothic Neo Light", size: 18)).bold()
                .padding(EdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 0))
            
            Text("매일 매일 운동 기록을 채워보세요!")
                .font(.custom("Apple SD Gothic Neo Light", size: 12))
                .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0))
            
            ScrollView {
                LazyVStack(pinnedViews: [.sectionHeaders]) {
                    Section(header: Header()) {
                        ForEach(contents, id: \.self) { name in
                            ListItem(title: name)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 4)
                        }
                    }
                }
            }.clipped()
        }.navigationTitle("통계")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct ListItem: View {
    let title: String
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            HStack {
                Text("거리").padding()
                Text("푸쉬").padding()
                Text("칼로리").padding()
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .frame(height: 100)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.blue)
                .opacity(0.2)
            Text(title)
                .foregroundColor(.black)
                .fontWeight(.bold)
        }
    }
}

struct Header: View {
    var body: some View {
        VStack {
            Spacer()
            Text("2022년")
                .fontWeight(.bold)
            Spacer()
            Divider()
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .frame(height: 56)
        .background(Rectangle().foregroundColor(.white))
    }
}



struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

