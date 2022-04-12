//
//  DiaryData.swift
//  WheelchairRun
//
//  Created by JiwKang on 2022/04/07.
//

import Foundation

class DiaryData {
    private var year: Int
    private var month: Int
    private var day: Int
    private var time: String
    private var pushCount: Int
    private var calorie: Int
    
    init(year: Int, month: Int, day: Int, time: String, pushCount: Int, calorie: Int) {
        self.year = year
        self.month = month
        self.day = day
        self.time = time
        self.pushCount = pushCount
        self.calorie = calorie
    }

    func getYear() -> Int {
        return year
    }
    func getMonth() -> Int {
        return month
    }
    func getDay() -> Int {
        return day
    }
    func getTime() -> String {
        return time
    }
    func getPushCount() -> Int {
        return pushCount
    }
    func getCalorie() -> Int {
        return calorie
    }
}

extension DiaryData {
    static let sampleData: [DiaryData] =
    [
        DiaryData(year: 2022, month: 4, day: 1, time: "00:23:34", pushCount: 130, calorie: 242),
        DiaryData(year: 2022, month: 3, day: 31, time: "00:24:52", pushCount: 234, calorie: 123),
        DiaryData(year: 2022, month: 3, day: 30, time: "00:49:32", pushCount: 345, calorie: 342),
        DiaryData(year: 2022, month: 3, day: 29, time: "00:30:45", pushCount: 122, calorie: 213),
        DiaryData(year: 2022, month: 3, day: 28, time: "00:35:34", pushCount: 324, calorie: 435),
        DiaryData(year: 2022, month: 3, day: 27, time: "00:12:52", pushCount: 432, calorie: 235),
        DiaryData(year: 2022, month: 3, day: 26, time: "00:49:14", pushCount: 127, calorie: 435),
        DiaryData(year: 2022, month: 3, day: 25, time: "00:36:56", pushCount: 154, calorie: 345),
        DiaryData(year: 2022, month: 3, day: 24, time: "00:12:34", pushCount: 164, calorie: 152),
        DiaryData(year: 2022, month: 3, day: 23, time: "00:34:55", pushCount: 134, calorie: 143),
        DiaryData(year: 2022, month: 3, day: 22, time: "00:46:10", pushCount: 176, calorie: 146),
        DiaryData(year: 2022, month: 3, day: 21, time: "00:28:11", pushCount: 134, calorie: 174),
        DiaryData(year: 2022, month: 3, day: 20, time: "00:27:45", pushCount: 154, calorie: 123),
        DiaryData(year: 2022, month: 3, day: 19, time: "00:49:23", pushCount: 143, calorie: 178),
        DiaryData(year: 2022, month: 3, day: 18, time: "00:18:43", pushCount: 254, calorie: 123),
        DiaryData(year: 2022, month: 3, day: 17, time: "00:17:51", pushCount: 345, calorie: 151),
        DiaryData(year: 2022, month: 3, day: 16, time: "00:16:23", pushCount: 236, calorie: 143),
        DiaryData(year: 2022, month: 3, day: 15, time: "00:17:43", pushCount: 165, calorie: 174),
        DiaryData(year: 2022, month: 3, day: 14, time: "00:32:52", pushCount: 198, calorie: 134),
        DiaryData(year: 2022, month: 3, day: 13, time: "00:35:10", pushCount: 165, calorie: 142),
        DiaryData(year: 2022, month: 3, day: 12, time: "00:33:06", pushCount: 365, calorie: 145),
        DiaryData(year: 2022, month: 3, day: 11, time: "00:32:05", pushCount: 124, calorie: 112),
        DiaryData(year: 2022, month: 3, day: 10, time: "00:15:04", pushCount: 130, calorie: 117)
    ]
}
