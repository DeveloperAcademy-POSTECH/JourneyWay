//
//  HomeView.swift
//  WheelchairRun
//
//  Created by  Isac Park on 2022/04/06.
//

import SwiftUI
import Shimmer

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                Hello_Profile()
                pushNgo()
                Today_Record()
                with_voice_mentor()
                
            }
        }
    }
}

struct Hello_Profile: View {
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            HStack(alignment: .top, spacing: 10){
                Spacer()
                VStack(alignment: .leading, spacing: 5){
                    HStack(alignment: .firstTextBaseline, spacing: 5){
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
        Spacer()
    }
}


struct pushNgo: View {
    @State private var isPresented = false
    
    var body: some View {
        Spacer()
        Button(action: {
            UIView.setAnimationsEnabled(false)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                isPresented.toggle()
            }
        }) {
            ZStack{
                Image("Circle_gradation")
                    .resizable()
                    .frame(width: 220, height: 220)
                Text("Push & Go")
                    .fontWeight(.bold)
                    .font(.largeTitle)
                    .shimmering(active: true, duration: 1.7, bounce: false)
                    .foregroundColor(Color(hue: 0.454, saturation: 1.0, brightness: 0.994))
            }
        }
        .buttonStyle(PopupBackgroundButtonStyle())
        .fullScreenCover(isPresented: $isPresented, onDismiss: {
            UIView.setAnimationsEnabled(true)
        }, content: {
//            TrackingView(isPresented: $isPresented)
        })
        Spacer()
    }
}


struct Today_Record: View {
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


struct with_voice_mentor: View {
    @State private var isPresented = false
    
    var body: some View {
        Button(action: {
            isPresented.toggle()
        }) {
            Text("with Voice Mentor")
                .font(.body)
                .fontWeight(.bold)
                .foregroundColor(Color(red: 0.431, green: 0.995, blue: 0.838))
                .background( Image("with_voice_mentor_background")
                    .resizable()
                    .frame(width: 230, height: 50))
        }
        .padding(.vertical, 50)
        .fullScreenCover(isPresented: $isPresented, onDismiss: {
            UIView.setAnimationsEnabled(true)
        }, content: {
            VoiceMentorContainerView()
        })
        
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
