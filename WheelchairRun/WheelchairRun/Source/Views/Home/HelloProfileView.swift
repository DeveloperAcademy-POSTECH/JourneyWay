//
//  HelloProfileView.swift
//  WheelchairRun
//
//  Created by Woody on 2022/04/18.
//

import SwiftUI

struct HelloProfileView: View {
    @State private var isPresented = false
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            HStack(alignment: .top, spacing: 10) {
                Spacer()
                VStack(alignment: .leading, spacing: 5) {
                    HStack(alignment: .firstTextBaseline, spacing: 5){
                        Text("안녕하세요,")
                            .font(.title3)
                        Text("요셉")
                            .font(.title)
                            .fontWeight(.semibold)
                        
                    }
                    Text("보이스 파트너와 함께")
                        .font(.title3)
                    Text("휠체어를 밀어보세요!")
                        .font(.title3)
                    
                }
                .padding(.leading, 30)
                .padding(.top, -30)
                Spacer(minLength: 50)
                NavigationLink(destination: ProfileView()) {
                    Image("Profile_img")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                .navigationBarBackButtonHidden(true)
                Spacer(minLength: 40)
            }
        }
        
    }
}
