//
//  DiaryList.swift
//  WheelchairRun
//
//  Created by JiwKang on 2022/04/12.
//

import SwiftUI

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
