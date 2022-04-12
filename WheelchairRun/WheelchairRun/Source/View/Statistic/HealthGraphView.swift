//
//  HealGraphView.swift
//  WheelchairRun
//
//  Created by JiwKang on 2022/04/12.
//

import SwiftUI

struct HealthGraphView: View {
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

struct HealGraphView_Previews: PreviewProvider {
    static var previews: some View {
        HealthGraphView()
    }
}
