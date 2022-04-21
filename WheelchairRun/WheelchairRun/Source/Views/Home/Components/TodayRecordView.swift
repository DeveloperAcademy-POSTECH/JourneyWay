//
//  TodayRecordView.swift
//  WheelchairRun
//
//  Created by Woody on 2022/04/18.
//

import SwiftUI

struct TodayRecordView: View {
    var body: some View {
        Spacer()
        VStack(alignment: .center, spacing: 10) {
            VStack(alignment: .leading, spacing: 25) {
                NavigationLink(destination: StatisticTabView()) {
                    HStack(spacing: 0.0){
                        Image("Today_Record_img")
                            .resizable()
                            .frame(width: 120, height: 40)
                            .padding(.horizontal, 30)
                    }
                    .padding(.vertical, 10)
                }.navigationBarBackButtonHidden(true)
                HStack{
                    Spacer()
                    Image("Clock_img")
                        .resizable()
                        .frame(width: 32.0, height: 32.0)
                    Spacer()
                    Image("Kcal_img")
                        .resizable()
                        .frame(width: 38.0, height: 38.0)
                    Spacer()
                    Image("Push_img")
                        .resizable()
                        .frame(width: 32.0, height: 32.0)
                    Spacer()
                }
                .padding(.horizontal, 3)
                .padding(.vertical, -20)
                
                HStack {
                    Spacer()
                    VStack(alignment: .center, spacing: 5){
                        Text("25:22")
                            .foregroundColor(Color.black)
                            .font(.title3)
                        Text("Time")
                            .font(.footnote)
                            .foregroundColor(Color.blue)
                        
                    }
                    Spacer()
                    VStack(alignment: .center, spacing: 5){
                        Text("132")
                            .foregroundColor(Color.black)
                            .font(.title3)
                        Text("Kcal")
                            .font(.footnote)
                            .foregroundColor(Color.blue)
                        
                    }
                    Spacer()
                    VStack(alignment: .center, spacing: 5){
                        Text("1422")
                            .foregroundColor(Color.black)
                            .font(.title3)
                        Text("Push")
                            .font(.footnote)
                            .foregroundColor(Color.blue)
                    }
                    .padding(.horizontal, 4)
                    Spacer()
                }
            }
            
        }
    }
}
