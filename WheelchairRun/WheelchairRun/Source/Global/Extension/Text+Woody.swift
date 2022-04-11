//
//  Text+Woody.swift
//  WheelchairRun
//
//  Created by Woody on 2022/04/11.
//

import SwiftUI

extension Text {
    func titleFont() -> some View {
        self.font(.title)
            .bold()
            .frame(maxWidth: .greatestFiniteMagnitude,
                   alignment: .leading)
    }
    
    func subTitleFont() -> some View {
        self.font(.subheadline)
            .frame(maxWidth: .greatestFiniteMagnitude,
                   alignment: .leading)
    }
    
    func headLineFont() -> some View {
        self.font(.headline)
            .frame(maxWidth: .greatestFiniteMagnitude,
                   alignment: .leading)
    }
    
}
