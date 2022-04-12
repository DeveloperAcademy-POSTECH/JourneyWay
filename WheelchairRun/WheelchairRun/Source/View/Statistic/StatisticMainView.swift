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
            .navigationTitle("통계")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct StatisticView: View {
    @State var selected = 2
    @State var items = ["Day", "Week", "Month"]
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text("건강기록")
                .font(.custom("Apple SD Gothic Neo Light", size: 22)).bold()
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
            
            Text("일, 주, 월 단위의 건강데이터 평균을 비교해 볼 수 있습니다.")
                .font(.custom("Apple SD Gothic Neo Light", size: 15))
                .padding(EdgeInsets(top: 0, leading: 11, bottom: 0, trailing: 0))
            
            //Divider()
            VStack {
                Picker("graph", selection: $selected) {
                    ForEach(0..<items.count, id: \.self) { i in
                        Text(items[i])
                    }
                }.pickerStyle(.segmented)
                
                TabView(selection: $selected) {
                    HBarGraph().tag(0)
                    HBarGraph().tag(1)
                    HBarGraph().tag(2)
                }
                .animation(.easeInOut)
                .tabViewStyle(.page(indexDisplayMode: .never))
                .frame(height: 250)
                .overlay(RoundedRectangle(cornerRadius: 20.0).stroke(Color("DarkGray")))
            }
            .padding(10)
            
            
            //Divider()
            Spacer()
            
            Text("어제의 나와 대결하기")
                .font(.custom("Apple SD Gothic Neo Light", size: 22)).bold()
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
            
            Text("더 건강해지기 위한 대결! 어제의 나에게 승리해보세요!")
                .font(.custom("Apple SD Gothic Neo Light", size: 15))
                .padding(EdgeInsets(top: 0, leading: 11, bottom: 0, trailing: 0))
            VBarGraph().padding(10)
            
            Spacer()
        }
        .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
    }
}

struct StatisticView2: View {
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
                    Section(header: Header()) {
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


/*
 
 ScrollView {
 LazyVStack(pinnedViews: [.sectionHeaders]) {
 Section(header: Header()) {
 ForEach(contents, id: \.self) { name in
 ////                            ListItem(title: name)
 //                                .padding(.horizontal, 12)
 //                                .padding(.vertical, 4)
 //                        }
 
 
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
 */

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

struct DiaryList: View {
    var diary: DiaryData
    
    var body: some View {
        HStack {
            VStack {
                Text("\(diary.getMonth())월")
                Text("\(diary.getDay())일")
            }
            .font(.system(size: 15, weight: .bold, design: .default))
            .padding(.leading)
            HStack {
                VStack {
                    Text("Time")
                        .font(.system(size: 13))
                        .bold()
                    Text("\(diary.getTime())")
                        .font(.system(size: 12))
                }.padding(21)
                VStack {
                    Text("Push")
                        .font(.system(size: 13))
                        .bold()
                    Text("\(diary.getPushCount())")
                        .font(.system(size: 12))
                }.padding(21)
                VStack {
                    Text("Calorie")
                        .font(.system(size: 13))
                        .bold()
                    Text("\(diary.getCalorie())")
                        .font(.system(size: 12))
                }.padding(21)
            }
            .background(
                RoundedRectangle(cornerRadius: 20.0).fill(Color.white)).shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                .padding(.top)
                .padding(.bottom)
                .padding(.leading, 20)
        }
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 20.0).fill(Color("Mint")))
        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 8))
    }
}


struct StatisticMainView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticMainView()
    }
}
