//
//  VoiceMentorViewModel.swift
//  WheelchairRun
//
//  Created by Woody on 2022/04/10.
//

import SwiftUI
import Combine

class VoiceMentorViewModel: ObservableObject {
    @Published var isCardViewClicked: Bool = false
    
    private let recentUsedVoiceMentorUserDefault: RecentUsedVoiceMentorUserDefault
    
    init(_ recentUsedVoiceMentorUserDefault: RecentUsedVoiceMentorUserDefault = RecentUsedVoiceMentorUserDefault()) {
        self.recentUsedVoiceMentorUserDefault = recentUsedVoiceMentorUserDefault
    }
    
}
