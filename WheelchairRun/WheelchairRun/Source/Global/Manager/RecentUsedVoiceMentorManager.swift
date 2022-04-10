//
//  RecentUsedMentorManager.swift
//  WheelchairRun
//
//  Created by Woody on 2022/04/10.
//

import Foundation

struct RecentUsedVoiceMentorManager: UserDefaultProtocol {
    typealias T = [VoiceMentor]
    private let key: String = UserDefaultsKeyName.recentUsed.rawValue
    
    var value: T? {
        return UserDefaults.standard.value(forKey: key) as? T
    }
    
    var isEmpty: Bool {
        return UserDefaults.standard.value(forKey: key) == nil
    }
    
    func save<T>(_ value: T) {
        UserDefaults.standard.set(value, forKey: key)
    }
}
