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
                            .frame(height: (CGFloat(diaryDatas[i].getPushCount() / 100) * size.height / 4))
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
                            .shadow(color: Color.black.opacity(0.4), radius: 5, x: 0, y: 2)
                    }
                    .frame(height: 40)
                }
            }
        }
        .padding()
        .overlay(RoundedRectangle(cornerRadius: 20.0).stroke(Color("DarkGray")))
    }
}

struct BarGraph_Previews: PreviewProvider {
    static var previews: some View {
        HealthGraphView()
    }
}
