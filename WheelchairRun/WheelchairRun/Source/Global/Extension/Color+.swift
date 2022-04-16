//
//  UIColor+Woody.swift
//  WheelchairRun
//
//  Created by Woody on 2022/04/08.
//

import SwiftUI

extension Color {
    
    /// hex값을 기반으로 Color 생성
    ///
    /// - Parameters: hex (String)
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >>  8) & 0xFF) / 255.0
        let b = Double((rgb >>  0) & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
}
