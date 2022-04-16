//
//  EmptyRecentView.swift
//  WheelchairRun
//
//  Created by Woody on 2022/04/13.
//

import SwiftUI

/// Leading, Trailing parametrr로 넘겨주어야 합니다.
/// 높이는 superView에서!
struct EmptyRecentView: View {
    
    var body: some View {
        Color.clear
            .overlay {
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Pallete.gray, lineWidth: 1)
                Text("최근 사용하신 프로그램이 없네요! 😭")
                    .fontWeight(.light)
                    .font(.system(size: 12))
            }
    }
}

struct EmptyRecentView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyRecentView()
    }
}
