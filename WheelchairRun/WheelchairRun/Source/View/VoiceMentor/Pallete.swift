//
//  Pallete.swift
//  WheelchairRun
//
//  Created by Woody on 2022/04/08.
//

import SwiftUI

/// 앱에 사용되는 모든 색상
struct Pallete {
    static let background: Color            = .white
    static let white: Color                 = .white
    static let black: Color                 = .black
    static let red: Color                   = .init(hex: "#E02828")
    static let yellow: Color                = .init(hex: "#FBF98F")
    static let cardPointColor3: Color       = .init(hex: "#E45151")
    static let cardPointColor4: Color       = .init(hex: "#18D87B")
    static let purple: Color                = .init(hex: "#7900FF")
    static let blue: Color                  = .init(hex: "#548CFF")
    static let mint: Color                  = .init(hex: "#93FFD8")
    static let lightMint: Color             = .init(hex: "#CFFFDC")
    
    static let redPoint: Color              = .init(hex: "#E02828")
    static let redPoint_black: Color        = .init(hex: "#B21C1C")
    static let purplePoint: Color           = .init(hex: "#B100FF")
    static let purplePoint_black: Color     = .init(hex: "#5800BA")
    static let bluePoint: Color             = .init(hex: "#664DE1")
    static let bluePoint_black: Color       = .init(hex: "#1A169A")
    static let greenPoint: Color            = .init(hex: "#4FD8AF")
    static let greenPoint_black: Color      = .init(hex: "#388A6C")
    
    struct Gradient {
        static let red: LinearGradient      = LinearGradient(colors: [Pallete.redPoint, Pallete.redPoint_black],
                                                             startPoint: .top,
                                                             endPoint: .bottom)
        static let purple: LinearGradient   = LinearGradient(colors: [Pallete.purplePoint, Pallete.purplePoint_black],
                                                             startPoint: .top,
                                                             endPoint: .bottom)
        static let blue: LinearGradient     = LinearGradient(colors: [Pallete.bluePoint, Pallete.bluePoint_black],
                                                             startPoint: .top,
                                                             endPoint: .bottom)
        static let green: LinearGradient    = LinearGradient(colors: [Pallete.greenPoint, Pallete.greenPoint_black],
                                                             startPoint: .top,
                                                             endPoint: .bottom)
    }
    
}
