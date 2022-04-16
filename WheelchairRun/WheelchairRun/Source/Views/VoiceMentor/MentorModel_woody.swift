//
//  MentorModel_woody.swift
//  WheelchairRun
//
//  Created by Woody on 2022/04/06.
//

import Foundation

struct MentorWoody {
    var name: String
    var time: String
    var emoji: String
    var content: String
    var profileImage: String = ""
    var date: Date = Date() // New를 판단하는 기준이 될 변수
    
    static let dummy: [MentorWoody] = [
        MentorWoody(name: "엘린의 명상", time: "5min", emoji: "🔥", content: "안녕하세요. 10년동안 명상을 수련한 엘린입니다. 이 프로그램은 5분동안 자신의 마음과 신체를 들여다보는 명상 러닝입니다. 단 5분의 Push&Run으로 얻을 수 있는 큰 에너지와 성취감을 경험해보세요. 단 5분의 Push&Run으로 얻을 수 있는 큰 에너지와 성취감을 경험해보세요. 잭 코치가 여러분이 새로운 Push 경험을 할 수 있도록 도와드립니다."),
        MentorWoody(name: "엘린의 명상", time: "5min", emoji: "🔥", content: "안녕하세요. 10년동안 명상을 수련한 엘린입니다. 이 프로그램은 5분동안 자신의 마음과 신체를 들여다보는 명상 러닝입니다. 단 5분의 Push&Run으로 얻을 수 있는 큰 에너지와 성취감을 경험해보세요. 단 5분의 Push&Run으로 얻을 수 있는 큰 에너지와 성취감을 경험해보세요. 잭 코치가 여러분이 새로운 Push 경험을 할 수 있도록 도와드립니다."),
        MentorWoody(name: "엘린의 명상", time: "5min", emoji: "🔥", content: "안녕하세요. 10년동안 명상을 수련한 엘린입니다. 이 프로그램은 5분동안 자신의 마음과 신체를 들여다보는 명상 러닝입니다. 단 5분의 Push&Run으로 얻을 수 있는 큰 에너지와 성취감을 경험해보세요. 단 5분의 Push&Run으로 얻을 수 있는 큰 에너지와 성취감을 경험해보세요. 잭 코치가 여러분이 새로운 Push 경험을 할 수 있도록 도와드립니다."),
        MentorWoody(name: "엘린의 명상", time: "5min", emoji: "🔥", content: "안녕하세요. 10년동안 명상을 수련한 엘린입니다. 이 프로그램은 5분동안 자신의 마음과 신체를 들여다보는 명상 러닝입니다. 단 5분의 Push&Run으로 얻을 수 있는 큰 에너지와 성취감을 경험해보세요. 단 5분의 Push&Run으로 얻을 수 있는 큰 에너지와 성취감을 경험해보세요. 잭 코치가 여러분이 새로운 Push 경험을 할 수 있도록 도와드립니다."),
        MentorWoody(name: "엘린의 명상", time: "5min", emoji: "🔥", content: "안녕하세요. 10년동안 명상을 수련한 엘린입니다. 이 프로그램은 5분동안 자신의 마음과 신체를 들여다보는 명상 러닝입니다. 단 5분의 Push&Run으로 얻을 수 있는 큰 에너지와 성취감을 경험해보세요. 단 5분의 Push&Run으로 얻을 수 있는 큰 에너지와 성취감을 경험해보세요. 잭 코치가 여러분이 새로운 Push 경험을 할 수 있도록 도와드립니다."),
        MentorWoody(name: "엘린의 명상", time: "5min", emoji: "🔥", content: "안녕하세요. 10년동안 명상을 수련한 엘린입니다. 이 프로그램은 5분동안 자신의 마음과 신체를 들여다보는 명상 러닝입니다. 단 5분의 Push&Run으로 얻을 수 있는 큰 에너지와 성취감을 경험해보세요. 단 5분의 Push&Run으로 얻을 수 있는 큰 에너지와 성취감을 경험해보세요. 잭 코치가 여러분이 새로운 Push 경험을 할 수 있도록 도와드립니다."),
        MentorWoody(name: "엘린의 명상", time: "5min", emoji: "🔥", content: "안녕하세요. 10년동안 명상을 수련한 엘린입니다. 이 프로그램은 5분동안 자신의 마음과 신체를 들여다보는 명상 러닝입니다. 단 5분의 Push&Run으로 얻을 수 있는 큰 에너지와 성취감을 경험해보세요. 단 5분의 Push&Run으로 얻을 수 있는 큰 에너지와 성취감을 경험해보세요. 잭 코치가 여러분이 새로운 Push 경험을 할 수 있도록 도와드립니다."),
        MentorWoody(name: "엘린의 명상", time: "5min", emoji: "🔥", content: "안녕하세요. 10년동안 명상을 수련한 엘린입니다. 이 프로그램은 5분동안 자신의 마음과 신체를 들여다보는 명상 러닝입니다. 단 5분의 Push&Run으로 얻을 수 있는 큰 에너지와 성취감을 경험해보세요. 단 5분의 Push&Run으로 얻을 수 있는 큰 에너지와 성취감을 경험해보세요. 잭 코치가 여러분이 새로운 Push 경험을 할 수 있도록 도와드립니다."),
        MentorWoody(name: "엘린의 명상", time: "5min", emoji: "🔥", content: "안녕하세요. 10년동안 명상을 수련한 엘린입니다. 이 프로그램은 5분동안 자신의 마음과 신체를 들여다보는 명상 러닝입니다. 단 5분의 Push&Run으로 얻을 수 있는 큰 에너지와 성취감을 경험해보세요. 단 5분의 Push&Run으로 얻을 수 있는 큰 에너지와 성취감을 경험해보세요. 잭 코치가 여러분이 새로운 Push 경험을 할 수 있도록 도와드립니다.")
    ]
}
