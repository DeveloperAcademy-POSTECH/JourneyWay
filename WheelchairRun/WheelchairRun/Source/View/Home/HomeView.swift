//
//  HomeView.swift
//  WheelchairRun
//
//  Created by  Isac Park on 2022/04/06.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Hello_Profile()
            pushNgo()
            Today_Record()
            with_voice_mentor()
        }
    }
}

struct Hello_Profile: View {
    var body: some View {
        
        Spacer()
        VStack(alignment: .center, spacing: 10) {
            HStack(alignment: .top, spacing: 10){
                Spacer()
                VStack(alignment: .leading, spacing: 5){
                    HStack{
                        Text("안녕하세요,")
                            .font(.title3)
                        Text("요셉")
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                    Text("보이스멘토와 함께")
                        .font(.title3)
                    Text("휠체어를 밀어보세요!")
                        .font(.title3)
                    
                }
                Spacer()
                Button(action: {print("Profile_Button")}){
                    Image("Profile_img")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                Spacer()
            }
        }
    }
}


struct pushNgo: View {
    var body: some View {
        Spacer()
        Button(action: {print("pushNgo_Button")}){
            Image("pushNgo_img")
                .resizable()
                .frame(width: 220, height: 220)
        }
        Spacer()
    }
}


struct Today_Record: View {
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            
            Button {
                print("Today_Record_Button")
            } label: {
                VStack(alignment: .leading, spacing: 25){
                    HStack(spacing: 0.0){
                        
                        Image("Today_Record_img")
                            .resizable()
                            .frame(width: 120, height: 40)
                        
                            .padding(.horizontal, 30)
                        
                    }
                    .padding(.vertical, 10)
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
                            Text("00:00")
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
}

struct with_voice_mentor: View {
    var body: some View {
        Spacer()
        Button(action: {print("with_voice_mentor_Button")}){
            Image("with_voice_mentor_img")
                .resizable()
                .frame(width: 230, height: 50)
        }
        .padding(.vertical, 20)
        
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
