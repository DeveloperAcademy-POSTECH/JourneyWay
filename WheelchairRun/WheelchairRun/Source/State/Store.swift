//
//  Store.swift
//  WheelchairRun
//
//  Created by Woody on 2022/04/16.
//

import SwiftUI

/// 단방향 흐름을 가능케 해주는 상태관리 Store
/// 내부에 Reducer와 State, Middleware가 관리해준다.
class Store<State, Action>: ObservableObject {
    @Published private(set) var state: State
    private let reducer: Reducer<State, Action>
    
    private let queue = DispatchQueue(
        label: "com.Milgo",
        qos: .userInitiated)
    init(initial: State,
         reducer: @escaping Reducer<State, Action>) {
        self.state = initial
        self.reducer = reducer
    }
    
    func dispatch(_ action: Action) {
        queue.sync {
            self.dispatch(self.state, action)
        }
    }
    
    private func dispatch(_ currentState: State, _ action: Action) {
        let newState = reducer(currentState, action)
        state = newState
    }
}

typealias MilgoStore = Store<MilgoState, MilgoAction>
