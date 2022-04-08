//
//  SwiftUIView.swift
//  WheelchairRun
//
//  Created by seojeon22 on 2022/04/07.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("건강기록")
                .font(.title).bold()
                .font(.system(size:15))

            Text("일, 주, 월 단위의 건강데이터 평균을 비교해 볼 수 있습니다.")
                .font(.subheadline)
            
            
            Spacer()
            
            Text("어제의 나와 대결하기")
                .font(.title).bold()
                .font(.system(size:10))
            
            Text("더 건강해지기 위한 대결! 어제의 나에게 승리해보세요!")
                .font(.subheadline)
            
            Spacer()
        }
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
