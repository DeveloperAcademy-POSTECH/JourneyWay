//
//  Popup.swift
//  WheelchairRun
//
//  Created by Woody on 2022/04/11.
//

import SwiftUI

enum PopupDirection {
    case middle
    case bottom
    
    func offset(popupFrame: CGRect) -> CGFloat {
        switch self {
        case .middle:
            // TODO: transition offset이 아니라 scale 처리해주어야 함
            let belowScreenEdge = UIScreen.main.bounds.height - popupFrame.minY
            return belowScreenEdge
        case .bottom:
            let belowScreenEdge = UIScreen.main.bounds.height - popupFrame.minY
            return belowScreenEdge
        }
    }
}

struct Popup<T: View>: ViewModifier {
    let popup: T
    let alignment: Alignment
    let direction: PopupDirection
    @EnvironmentObject var store: MilgoStore
    
    fileprivate init(alignment: Alignment,
                     direction: PopupDirection,
                     @ViewBuilder content: () -> T) {
        self.alignment = alignment
        self.direction = direction
        popup = content()
    }
    
    func body(content: Content) -> some View {
        ZStack {
            content
            popupContent()
        }
    }
    
    private func popupContent() -> some View {
        GeometryReader { geometry in
            
            if store.state.isPopupPresented {
                popup
                    .animation(.spring(), value: store.state.isPopupPresented)
                    .transition(.offset(x: 0, y: direction.offset(popupFrame: geometry.frame(in: .global))))
                    .frame(width: geometry.size.width,
                           height: geometry.size.height,
                           alignment: alignment)
            }
        }
    }
}

extension View {
    func popup<T: View>(alignment: Alignment,
                        direction: PopupDirection,
                        @ViewBuilder content: () -> T) -> some View {
        modifier(Popup(alignment: alignment,
                       direction: direction,
                       content: content))
        .zIndex(1)
    }
    
}
