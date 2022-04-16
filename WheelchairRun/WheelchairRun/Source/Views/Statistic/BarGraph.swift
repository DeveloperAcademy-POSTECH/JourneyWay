//
//  BarGraph.swift
//  WheelchairRun
//
//  Created by JiwKang on 2022/04/12.
//

import SwiftUI

//struct HBarGraph: View {
//    var diaryDatas: [DiaryData] = DiaryData.sampleData
//    var body: some View {
//        HStack(spacing: 10) {
//
//            ForEach(1..<8, id: \.self) { i in
//
//                VStack(spacing: 20) {
//                    GeometryReader { proxy in
//                        let size = proxy.size
//                        RoundedRectangle(cornerRadius: 6)
//                            .fill(i % 2 == 0 ? Color("LightGreen") : Color("Mint"))
//                            .frame(width: 30, height: (CGFloat(diaryDatas[i].getPushCount() / 100) * size.height / 4))
//                            .frame(maxHeight: .infinity, alignment: .bottom)
//                            .shadow(color: Color.black.opacity(0.4), radius: 5, x: 0, y: 2)
//                    }
//                    Text("\(i)월")
//                }
//            }
//        }
//        .frame(height: 200)
//        .padding()
////        .background(RoundedRectangle(cornerRadius: 20.0).fill(Color("DarkGray")))
////        .overlay(RoundedRectangle(cornerRadius: 20.0).stroke(Color("DarkGray")))
//    }
//}

struct HBarGraph: View {
    
    // 0: Day, 1: Week, 2: Month
    var selectedTab: Int
    
    var diaryRowDatas: [DiaryRowData] = DiaryData.sampleData[0].getValues()
    
    var body: some View {
        
        if selectedTab == 0 {
            DayHBarGraph(diraySampleData: diaryRowDatas)
        }else if selectedTab == 1 {
            WeekHBarGraph()
        }else if selectedTab == 2 {
            MonthHBarGraph()
        }
    }
}

struct DayHBarGraph: View {
    var diraySampleData: [DiaryRowData]
    
    var body: some View {
        HStack(spacing: 10) {
            
            ForEach(0..<7, id: \.self) { i in
                
                VStack(spacing: 20) {
                    
                    GeometryReader { proxy in
                        let size = proxy.size
                        
                        RoundedRectangle(cornerRadius: 6)
                            .fill(i % 2 == 0 ? Color("LightGreen") : Color("Mint"))
                            .frame(width: 30, height: (CGFloat(diraySampleData[6 - i].getPushCount() / 100) * size.height / 4))
                            .frame(maxHeight: .infinity, alignment: .bottom)
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                    }.padding(EdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 0))
                    //                    Text((i != 0 && diraySampleData[6 - i + 1].getMonth() != diraySampleData[6 - i].getMonth()) ? "\(diraySampleData[6 - i].getMonth())/\(diraySampleData[6 - i].getDay())" : "\(diraySampleData[6 - i].getDay())")
                    //                        .frame(width: 30)
                    Text("\(diraySampleData[6 - i].getDay())일")
                    //                        .frame(width: 50)
                }
            }
        }
        .frame(height: 200)
        .padding()
        //        .background(RoundedRectangle(cornerRadius: 20.0).fill(Color("DarkGray")))
        //        .overlay(RoundedRectangle(cornerRadius: 20.0).stroke(Color("DarkGray")))
    }
}

struct WeekHBarGraph: View {
    var weekSampleData = [125,179,162,150]
    
    var body: some View {
        HStack(spacing: 10) {
            
            ForEach(0..<4, id: \.self) { i in
                
                VStack(spacing: 20) {
                    
                    GeometryReader { proxy in
                        let size = proxy.size
                        
                        RoundedRectangle(cornerRadius: 6)
                            .fill(i % 2 == 0 ? Color("LightGreen") : Color("Mint"))
                            .frame(width: 40, height: (CGFloat(weekSampleData[i] - 50)))
                            .frame(maxHeight: .infinity, alignment: .bottom)
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                    }
                    .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 10))
                    Text("\(i + 1)주")
                }
            }
        }
        .frame(height: 200)
        .padding()
        //        .background(RoundedRectangle(cornerRadius: 20.0).fill(Color("DarkGray")))
        //        .overlay(RoundedRectangle(cornerRadius: 20.0).stroke(Color("DarkGray")))
    }
}

struct MonthHBarGraph: View {
    var monthSampleData = [125,152,142,138,120,163]
    
    var body: some View {
        HStack(spacing: 10) {
            
            ForEach(0..<monthSampleData.count, id: \.self) { i in
                
                VStack(spacing: 20) {
                    
                    GeometryReader { proxy in
                        let size = proxy.size
                        
                        RoundedRectangle(cornerRadius: 6)
                            .fill(i % 2 == 0 ? Color("LightGreen") : Color("Mint"))
                            .frame(width: 30, height: (CGFloat(monthSampleData[i])))
                            .frame(maxHeight: .infinity, alignment: .bottom)
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                    }.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                    Text("\(i - 1 <= 0 ? i + 11 : i - 1)월")
                }
            }
        }
        .frame(height: 200)
        .padding()
        //        .background(RoundedRectangle(cornerRadius: 20.0).fill(Color("DarkGray")))
        //        .overlay(RoundedRectangle(cornerRadius: 20.0).stroke(Color("DarkGray")))
    }
}

//struct VBarGraph: View {
//    var diaryDatas: [DiaryData] = DiaryData.sampleData
//    var body: some View {
//        VStack{
//            ForEach(0..<2, id: \.self) { i in
//                HStack {
//                    Text("Date")
//                    GeometryReader { proxy in
//                        RoundedRectangle(cornerRadius: 6)
//                            .fill(i % 2 == 0 ? Color("LightGreen") : Color("Mint"))
//                            .frame(width: (CGFloat(diaryDatas[i].getPushCount() / 80) * 100))
//                            .frame(alignment: .bottom)
//                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
//                    }
//                    .frame(height: 40)
//                }
//            }
//        }
//        .padding()
//        .overlay(RoundedRectangle(cornerRadius: 20.0).stroke(Color("DarkGray")))
//    }
//}

struct Medal: View {
    var body: some View {
        
        var level: Int = 152
        
        VStack {
            HStack {
                if level < 10 {
                    Image("bronzeMedal")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } else if level < 100 {
                    Image("silverMedal")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } else {
                    Image("goldMedal")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                
                VStack(alignment: .center) {
                    Text("멋지네요!\n오늘도 어제의 기록을 넘었어요! \n").multilineTextAlignment(.center)
                    Text("연속기록: \(level)일").bold()
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: 150)
        
        
    }
}

struct MedalLevel: View {
    var body: some View {
        Text("Level")
    }
}

struct BarGraph_Previews: PreviewProvider {
    static var previews: some View {
        HealthGraphView()
    }
}
