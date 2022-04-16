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
    @Published private(set) var state: State
    @Published var isVoicePartnerPresented: Bool = false // FIXME: 모달 화면전환때문에 존재하는 코드, 상태 코드인데 fullScreenCover에 바인드시켜야하므로 어쩔 수 없는 상황 ㅠㅠ
     
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

extension MilgoStore {
   
    func presentVoicePartner() {
        isVoicePartnerPresented = true
    }
    
    func dismissVoicePartner() {
        isVoicePartnerPresented = false
    }
}

typealias MilgoStore = Store<MilgoState, MilgoAction>
