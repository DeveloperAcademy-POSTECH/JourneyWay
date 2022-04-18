//
//  Store.swift
//  WheelchairRun
//
//  Created by Woody on 2022/04/16.
//

import SwiftUI
import Combine

/// 단방향 흐름을 도와주는 상태관리 Store 객체
/// - reducer, State, middleware를 관리
class Store<State, Action>: ObservableObject {
    @Published var state: State // TODO: private(set) 생각필요
     
    private let reducer: Reducer<State, Action>
    private let middlewares: [Middleware<State, Action>]
    private var disposeBag: Set<AnyCancellable> = []
    
    private let queue = DispatchQueue(
        label: "com.Milgo",
        qos: .userInitiated)
    
    init(initial: State,
         reducer: @escaping Reducer<State, Action>,
         middlewares: [Middleware<State, Action>] = []) {
        self.state = initial
        self.reducer = reducer
        self.middlewares = middlewares
    }
    
    func dispatch(_ action: Action) {
        queue.sync {
            self.dispatch(self.state, action)
        }
        
        middlewares.forEach { middleware in
            let publisher = middleware(state, action)
            
            publisher
                .receive(on: DispatchQueue.main)
                .sink(receiveValue: dispatch)
                .store(in: &disposeBag)
        }
    }

    private func dispatch(_ currentState: State, _ action: Action) {
        let newState = reducer(currentState, action)
        state = newState
    }
    
}

typealias MilgoStore = Store<MilgoState, MilgoAction>
