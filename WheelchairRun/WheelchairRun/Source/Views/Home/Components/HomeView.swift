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
                HelloProfileView()
                PushNgoButton()
                TodayRecordView()
                WithVoiceMentorButton()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
