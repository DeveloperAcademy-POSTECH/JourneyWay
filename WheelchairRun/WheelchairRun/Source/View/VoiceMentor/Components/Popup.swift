//
//  Popup.swift
//  WheelchairRun
//
//  Created by Woody on 2022/04/11.
//

import SwiftUI

/// 팝업
/// ViewModifier 프로토콜을 준수하게 된다면,  모든 뷰에 적용할 수 있는 재사용가능한 modifier를 만듭니다.
/// 아래 예는 여러 수정자를 결합하여 둥근 사각형으로 둘러싸인 파란색 캡션 텍스트를 만드는 데 사용할 수 있는 새 수정자를 만듭니다.
struct Popup<T: View>: ViewModifier {
    let popup: T
    let alignment: Alignment
    let direction: PopupDirection
    @Binding var isPopupPresented: Bool
    
    init(isPopupPresented: Binding<Bool>,
         alignment: Alignment,
         direction: PopupDirection,
         @ViewBuilder content: () -> T) {
        self._isPopupPresented = isPopupPresented
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
            
            if isPopupPresented {
                popup
                    .animation(.spring(), value: isPopupPresented)
                    .transition(.offset(x: 0, y: direction.offset(popupFrame: geometry.frame(in: .global))))
                    .frame(width: geometry.size.width,
                           height: geometry.size.height,
                           alignment: alignment)
            }
        }
    }
}

struct BackgroundView: View {
    var body: some View {
        Color.black.opacity(0.6)
    }
}

extension View {
    func popup<T: View>(isPopupPresented: Binding<Bool>,
                        alignment: Alignment,
                        direction: PopupDirection,
                        @ViewBuilder content: () -> T) -> some View {
        blur(radius: 0)
            .modifier(Popup(isPopupPresented: isPopupPresented,
                            alignment: alignment,
                            direction: direction,
                            content: content))
    }
    
}

enum PopupDirection {
    case top, bottom
    
    func offset(popupFrame: CGRect) -> CGFloat {
        switch self {
        case .top:
            let aboveScreenEdge = -popupFrame.maxY
            return aboveScreenEdge
        case .bottom:
            let belowScreenEdge = UIScreen.main.bounds.height - popupFrame.minY
            return belowScreenEdge
        }
    }
}

