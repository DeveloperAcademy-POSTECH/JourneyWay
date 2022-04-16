//
//  VoicePartnerContentView.swift
//  WheelchairRun
//
//  Created by Woody on 2022/04/17.
//

import SwiftUI

struct VoicePartnerContentView: View {
    @EnvironmentObject var store: MilgoStore
    var body: some View {
        VoiceMentorView()
    }
}

struct VoicePartnerContentView_Previews: PreviewProvider {
    static var previews: some View {
        VoicePartnerContentView()
    }
}
