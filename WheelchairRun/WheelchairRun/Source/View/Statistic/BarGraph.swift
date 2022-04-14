//
//  BarGraph.swift
//  WheelchairRun
//
//  Created by JiwKang on 2022/04/12.
//

import SwiftUI

struct HBarGraph: View {
    var diaryDatas: [DiaryData] = DiaryData.sampleData
    var body: some View {
        HStack(spacing: 10) {
            
            ForEach(1..<8, id: \.self) { i in
                
                VStack(spacing: 20) {
                    GeometryReader { proxy in
                        let size = proxy.size
                        RoundedRectangle(cornerRadius: 6)
                            .fill(i % 2 == 0 ? Color("LightGreen") : Color("Mint"))
                            .frame(width: 30, height: (CGFloat(diaryDatas[i].getPushCount() / 100) * size.height / 4))
                            .frame(maxHeight: .infinity, alignment: .bottom)
                            .shadow(color: Color.black.opacity(0.4), radius: 5, x: 0, y: 2)
                    }
                    Text("\(i)월")
                }
            }
        }
        .frame(height: 200)
        .padding()
//        .background(RoundedRectangle(cornerRadius: 20.0).fill(Color("DarkGray")))
//        .overlay(RoundedRectangle(cornerRadius: 20.0).stroke(Color("DarkGray")))
    }
}

struct VBarGraph: View {
    var diaryDatas: [DiaryData] = DiaryData.sampleData
    var body: some View {
        VStack{
            ForEach(0..<2, id: \.self) { i in
                HStack {
                    Text("Date")
                    GeometryReader { proxy in
                        RoundedRectangle(cornerRadius: 6)
                            .fill(i % 2 == 0 ? Color("LightGreen") : Color("Mint"))
                            .frame(width: (CGFloat(diaryDatas[i].getPushCount() / 80) * 100))
                            .frame(alignment: .bottom)
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                    }
                    .frame(height: 40)
                }
            }
        }
        .padding()
        .overlay(RoundedRectangle(cornerRadius: 20.0).stroke(Color("DarkGray")))
    }
}

struct Medal: View {
    var body: some View {
        
        var level: Int = 1
        
        VStack(alignment: .center) {
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
            Text("멋지네요 오늘도 어제의 기록을 넘었어요!")
            Text("연속기록").bold()
            Text("3일").bold()
            Spacer()
            
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
