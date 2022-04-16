//
//  Middleware.swift
//  WheelchairRun
//
//  Created by Woody on 2022/04/17.
//

import Combine

typealias Middleware<State, Action> = (State, Action) -> AnyPublisher<Action, Never>
