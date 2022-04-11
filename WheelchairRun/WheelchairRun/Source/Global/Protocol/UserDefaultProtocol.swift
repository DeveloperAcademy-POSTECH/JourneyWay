//
//  UserDefaultProtocol.swift
//  WheelchairRun
//
//  Created by Woody on 2022/04/10.
//

import Foundation

/// UserDefaults 사용할 때 준수해야하는 프로토콜입니다.
///
/// 타입을 정하고, key를 private으로 선언하여
/// key값을 한곳에 모아두려고 합니다ㅏ.
protocol UserDefaultProtocol {
    associatedtype T
    
    var value: T? { get }
    var isEmpty: Bool { get }
    func save<T>(_ value: T)
}

enum UserDefaultsKeyName: String {
    case user
    case recentUsed
}
