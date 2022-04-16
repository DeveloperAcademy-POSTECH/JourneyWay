//
//  User.swift
//  WheelchairRun
//
//  Created by Woody on 2022/04/12.
//

import Foundation

struct User: Identifiable {
    var id: UUID
    var name: String
    var continuousDay: Int {
        didSet {
            if continuousDay >= 15 {
                badge = .gold
            } else if continuousDay >= 10 {
                badge = .silver
            } else {
                badge = .bronze
            }
        }
    }
    var badge: BadgeStage
}
