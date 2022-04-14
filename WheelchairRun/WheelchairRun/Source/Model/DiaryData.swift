//
//  DiaryData.swift
//  WheelchairRun
//
//  Created by JiwKang on 2022/04/07.
//

import Foundation

class DiaryData {
    private var year: Int
    private var values: [DiaryRowData]
    
    init(year: Int, values: [DiaryRowData]) {
        self.year = year
        self.values = values
    }

    func getYear() -> Int {
        return year
    }
    
    func getValues() -> [DiaryRowData] {
        return values
    }
}

class DiaryRowData {
    private var month: Int
    private var day: Int
    private var time: String
    private var pushCount: Int
    private var distance: Int
    
    init(month: Int, day: Int, time: String, pushCount: Int, distance: Int) {
        self.month = month
        self.day = day
        self.time = time
        self.pushCount = pushCount
        self.distance = distance
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
    func getDistance() -> Int {
        return distance
    }
}

extension DiaryData {
    static let sampleData: [DiaryData] =
    [
        DiaryData(year: 2022, values: [
            DiaryRowData(month: 4, day: 1, time: "00:23:34", pushCount: 130, distance: 242),
            DiaryRowData(month: 3, day: 31, time: "00:24:52", pushCount: 234, distance: 123),
            DiaryRowData(month: 3, day: 30, time: "00:49:32", pushCount: 345, distance: 342),
            DiaryRowData(month: 3, day: 29, time: "00:30:45", pushCount: 122, distance: 213),
            DiaryRowData(month: 3, day: 28, time: "00:35:34", pushCount: 324, distance: 435),
            DiaryRowData(month: 3, day: 27, time: "00:12:52", pushCount: 432, distance: 235),
            DiaryRowData(month: 3, day: 26, time: "00:49:14", pushCount: 127, distance: 435),
            DiaryRowData(month: 3, day: 25, time: "00:36:56", pushCount: 154, distance: 345),
            DiaryRowData(month: 3, day: 24, time: "00:12:34", pushCount: 164, distance: 152),
            DiaryRowData(month: 3, day: 23, time: "00:34:55", pushCount: 134, distance: 143)
        ]),
        DiaryData(year: 2021, values: [
            DiaryRowData(month: 3, day: 22, time: "00:46:10", pushCount: 176, distance: 146),
            DiaryRowData(month: 3, day: 21, time: "00:28:11", pushCount: 134, distance: 174),
            DiaryRowData(month: 3, day: 20, time: "00:27:45", pushCount: 154, distance: 123),
            DiaryRowData(month: 3, day: 19, time: "00:49:23", pushCount: 143, distance: 178),
            DiaryRowData(month: 3, day: 18, time: "00:18:43", pushCount: 254, distance: 123),
            DiaryRowData(month: 3, day: 17, time: "00:17:51", pushCount: 345, distance: 151),
            DiaryRowData(month: 3, day: 16, time: "00:16:23", pushCount: 236, distance: 143),
            DiaryRowData(month: 3, day: 15, time: "00:17:43", pushCount: 165, distance: 174),
            DiaryRowData(month: 3, day: 14, time: "00:32:52", pushCount: 198, distance: 134),
            DiaryRowData(month: 3, day: 13, time: "00:35:10", pushCount: 165, distance: 142),
            DiaryRowData(month: 3, day: 12, time: "00:33:06", pushCount: 365, distance: 145),
            DiaryRowData(month: 3, day: 11, time: "00:32:05", pushCount: 124, distance: 112),
            DiaryRowData(month: 3, day: 10, time: "00:15:04", pushCount: 130, distance: 117)
        ]),
        DiaryData(year: 2020, values: [
            DiaryRowData(month: 3, day: 22, time: "00:46:10", pushCount: 176, distance: 146),
            DiaryRowData(month: 3, day: 21, time: "00:28:11", pushCount: 134, distance: 174),
            DiaryRowData(month: 3, day: 20, time: "00:27:45", pushCount: 154, distance: 123),
            DiaryRowData(month: 3, day: 19, time: "00:49:23", pushCount: 143, distance: 178),
            DiaryRowData(month: 3, day: 18, time: "00:18:43", pushCount: 254, distance: 123),
            DiaryRowData(month: 3, day: 17, time: "00:17:51", pushCount: 345, distance: 151),
            DiaryRowData(month: 3, day: 16, time: "00:16:23", pushCount: 236, distance: 143),
            DiaryRowData(month: 3, day: 15, time: "00:17:43", pushCount: 165, distance: 174),
            DiaryRowData(month: 3, day: 14, time: "00:32:52", pushCount: 198, distance: 134),
            DiaryRowData(month: 3, day: 13, time: "00:35:10", pushCount: 165, distance: 142),
            DiaryRowData(month: 3, day: 12, time: "00:33:06", pushCount: 365, distance: 145),
            DiaryRowData(month: 3, day: 11, time: "00:32:05", pushCount: 124, distance: 112),
            DiaryRowData(month: 3, day: 10, time: "00:15:04", pushCount: 130, distance: 117)
        ]),
        DiaryData(year: 2019, values: [
            DiaryRowData(month: 3, day: 22, time: "00:46:10", pushCount: 176, distance: 146),
            DiaryRowData(month: 3, day: 21, time: "00:28:11", pushCount: 134, distance: 174),
            DiaryRowData(month: 3, day: 20, time: "00:27:45", pushCount: 154, distance: 123),
            DiaryRowData(month: 3, day: 19, time: "00:49:23", pushCount: 143, distance: 178),
            DiaryRowData(month: 3, day: 18, time: "00:18:43", pushCount: 254, distance: 123),
            DiaryRowData(month: 3, day: 17, time: "00:17:51", pushCount: 345, distance: 151),
            DiaryRowData(month: 3, day: 16, time: "00:16:23", pushCount: 236, distance: 143),
            DiaryRowData(month: 3, day: 15, time: "00:17:43", pushCount: 165, distance: 174),
            DiaryRowData(month: 3, day: 14, time: "00:32:52", pushCount: 198, distance: 134),
            DiaryRowData(month: 3, day: 13, time: "00:35:10", pushCount: 165, distance: 142),
            DiaryRowData(month: 3, day: 12, time: "00:33:06", pushCount: 365, distance: 145),
            DiaryRowData(month: 3, day: 11, time: "00:32:05", pushCount: 124, distance: 112),
            DiaryRowData(month: 3, day: 10, time: "00:15:04", pushCount: 130, distance: 117)
        ]),
        DiaryData(year: 2018, values: [
            DiaryRowData(month: 3, day: 22, time: "00:46:10", pushCount: 176, distance: 146),
            DiaryRowData(month: 3, day: 21, time: "00:28:11", pushCount: 134, distance: 174),
            DiaryRowData(month: 3, day: 20, time: "00:27:45", pushCount: 154, distance: 123),
            DiaryRowData(month: 3, day: 19, time: "00:49:23", pushCount: 143, distance: 178),
            DiaryRowData(month: 3, day: 18, time: "00:18:43", pushCount: 254, distance: 123),
            DiaryRowData(month: 3, day: 17, time: "00:17:51", pushCount: 345, distance: 151),
            DiaryRowData(month: 3, day: 16, time: "00:16:23", pushCount: 236, distance: 143),
            DiaryRowData(month: 3, day: 15, time: "00:17:43", pushCount: 165, distance: 174),
            DiaryRowData(month: 3, day: 14, time: "00:32:52", pushCount: 198, distance: 134),
            DiaryRowData(month: 3, day: 13, time: "00:35:10", pushCount: 165, distance: 142),
            DiaryRowData(month: 3, day: 12, time: "00:33:06", pushCount: 365, distance: 145),
            DiaryRowData(month: 3, day: 11, time: "00:32:05", pushCount: 124, distance: 112),
            DiaryRowData(month: 3, day: 10, time: "00:15:04", pushCount: 130, distance: 117)
        ]),
        DiaryData(year: 2017, values: [
            DiaryRowData(month: 3, day: 22, time: "00:46:10", pushCount: 176, distance: 146),
            DiaryRowData(month: 3, day: 21, time: "00:28:11", pushCount: 134, distance: 174),
            DiaryRowData(month: 3, day: 20, time: "00:27:45", pushCount: 154, distance: 123),
            DiaryRowData(month: 3, day: 19, time: "00:49:23", pushCount: 143, distance: 178),
            DiaryRowData(month: 3, day: 18, time: "00:18:43", pushCount: 254, distance: 123),
            DiaryRowData(month: 3, day: 17, time: "00:17:51", pushCount: 345, distance: 151),
            DiaryRowData(month: 3, day: 16, time: "00:16:23", pushCount: 236, distance: 143),
            DiaryRowData(month: 3, day: 15, time: "00:17:43", pushCount: 165, distance: 174),
            DiaryRowData(month: 3, day: 14, time: "00:32:52", pushCount: 198, distance: 134),
            DiaryRowData(month: 3, day: 13, time: "00:35:10", pushCount: 165, distance: 142),
            DiaryRowData(month: 3, day: 12, time: "00:33:06", pushCount: 365, distance: 145),
            DiaryRowData(month: 3, day: 11, time: "00:32:05", pushCount: 124, distance: 112),
            DiaryRowData(month: 3, day: 10, time: "00:15:04", pushCount: 130, distance: 117)
        ]),
        DiaryData(year: 2016, values: [
            DiaryRowData(month: 3, day: 22, time: "00:46:10", pushCount: 176, distance: 146),
            DiaryRowData(month: 3, day: 21, time: "00:28:11", pushCount: 134, distance: 174),
            DiaryRowData(month: 3, day: 20, time: "00:27:45", pushCount: 154, distance: 123),
            DiaryRowData(month: 3, day: 19, time: "00:49:23", pushCount: 143, distance: 178),
            DiaryRowData(month: 3, day: 18, time: "00:18:43", pushCount: 254, distance: 123),
            DiaryRowData(month: 3, day: 17, time: "00:17:51", pushCount: 345, distance: 151),
            DiaryRowData(month: 3, day: 16, time: "00:16:23", pushCount: 236, distance: 143),
            DiaryRowData(month: 3, day: 15, time: "00:17:43", pushCount: 165, distance: 174),
            DiaryRowData(month: 3, day: 14, time: "00:32:52", pushCount: 198, distance: 134),
            DiaryRowData(month: 3, day: 13, time: "00:35:10", pushCount: 165, distance: 142),
            DiaryRowData(month: 3, day: 12, time: "00:33:06", pushCount: 365, distance: 145),
            DiaryRowData(month: 3, day: 11, time: "00:32:05", pushCount: 124, distance: 112),
            DiaryRowData(month: 3, day: 10, time: "00:15:04", pushCount: 130, distance: 117)
        ]),
        DiaryData(year: 2015, values: [
            DiaryRowData(month: 3, day: 22, time: "00:46:10", pushCount: 176, distance: 146),
            DiaryRowData(month: 3, day: 21, time: "00:28:11", pushCount: 134, distance: 174),
            DiaryRowData(month: 3, day: 20, time: "00:27:45", pushCount: 154, distance: 123),
            DiaryRowData(month: 3, day: 19, time: "00:49:23", pushCount: 143, distance: 178),
            DiaryRowData(month: 3, day: 18, time: "00:18:43", pushCount: 254, distance: 123),
            DiaryRowData(month: 3, day: 17, time: "00:17:51", pushCount: 345, distance: 151),
            DiaryRowData(month: 3, day: 16, time: "00:16:23", pushCount: 236, distance: 143),
            DiaryRowData(month: 3, day: 15, time: "00:17:43", pushCount: 165, distance: 174),
            DiaryRowData(month: 3, day: 14, time: "00:32:52", pushCount: 198, distance: 134),
            DiaryRowData(month: 3, day: 13, time: "00:35:10", pushCount: 165, distance: 142),
            DiaryRowData(month: 3, day: 12, time: "00:33:06", pushCount: 365, distance: 145),
            DiaryRowData(month: 3, day: 11, time: "00:32:05", pushCount: 124, distance: 112),
            DiaryRowData(month: 3, day: 10, time: "00:15:04", pushCount: 130, distance: 117)
        ])
        
    ]
}
