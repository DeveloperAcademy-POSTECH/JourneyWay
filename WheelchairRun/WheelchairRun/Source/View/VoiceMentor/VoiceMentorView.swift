//
//  VoiceMentorView.swift
//  WheelchairRun
//
//  Created by Woody on 2022/04/10.
//

import SwiftUI

struct VoiceMentorView: View {
    
    let recentVoiceMentorList = RecentVoiceMentorList()
    
    var body: some View {
        VStack {
            HStack {
                Text("Voice Mentor")
                    .fontWeight(.bold)
                    .font(.system(size: 30))
                    .frame(maxWidth: .greatestFiniteMagnitude, alignment: .leading)
                Button(action: {}) {
                    Image(systemName: "xmark")
                        .tint(Pallete.black)
                        .frame(width: 24, height: 24, alignment: .center)
                }
            } // header
            .padding([.top, .leading, .trailing], 24)
            Text("Select your favorite voice to listen while exercsing")
                .font(.subheadline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.leading, .trailing], 24)
            // subheadline
            
            ScrollView(.vertical) {
                RecentVoiceMentorList()
                    .frame(width: .infinity, height: 200)
                Text("New")
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 25))
                    .padding([.leading, .trailing], 24)
                ForEach(0..<10) { _ in
                    VoiceMentorCardRow()
                }
            }
            Spacer()
        }
        
    }
}

struct VoiceMentorView_Previews: PreviewProvider {
    static var previews: some View {
        VoiceMentorView()
    }
}
