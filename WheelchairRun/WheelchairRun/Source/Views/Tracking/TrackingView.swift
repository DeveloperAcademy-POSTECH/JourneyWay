//
//  TrackingView.swift
//  WheelchairRun
//
//  Created by Noah Park on 2022/04/06.
//

import SwiftUI
import Combine
import CoreData

struct TrackingView: View {
    // TODO: 나스닥한테 물어보기
    var pedometerDistanceText: String = "0.00"
    
    // TODO: 나스닥한테 물어보기 - TrackingViewState는 프로그램이 아니라 상태를 관리하는 객체인데 program이라는 명명이 맞을까?
    @ObservedObject var program: TrackingViewState
    @State var counter: Double = 4.0
    
    private let timer = Timer.publish(every: 0.1, tolerance: 0.01, on: .main, in: .common).autoconnect()
    private let readyText: [String] = ["오늘 컨디션을 어떠세요?",
                                       "길 안전은 확인하셨나요?",
                                       "이제 휠체어를 밀어볼까요?"]
    
    var body: some View {
        ZStack {
            if !program.isPreparing {
                VStack {
                    if !program.isComplete {
                        EmergencyButton()
                            .padding()
                        Text(program.program.programName ?? "Free Running")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .lineLimit(1)
                            .padding()
                        ProgramProgressBar(program: program, timer: timer)
                            .padding(30)
                        StatsInfoModule(program: program)
                        Spacer(minLength: 50)
                        PlayBackController(program: program)
                    } else {
                        CompleteView(program: program)
                    }
                }
                .onAppear {
                    program.playVoiceMentor()
                }
            } else {
                Pallete.purple
                    .ignoresSafeArea()
                if counter > 0 {
                    VStack {
                        Text(readyText[0])
                            .font(Font.system(size: 30).italic().bold())
                            .foregroundColor(counter <= 3 ? Pallete.mint : Pallete.blue)
                            .padding()
                        Text(readyText[1])
                            .font(Font.system(size: 30).italic().bold())
                            .foregroundColor(counter <= 2 ? Pallete.mint : Pallete.blue)
                            .padding()
                        Text(readyText[2])
                            .font(Font.system(size: 30).italic().bold())
                            .foregroundColor(counter <= 1 ? Pallete.mint : Pallete.blue)
                            .padding()
                        
                    }.onReceive(timer) { _ in
                        counter -= 0.1
                    }
                } else {
                    Text("PUSH!")
                        .font(Font.system(size: 100).italic().bold())
                        .foregroundColor(Pallete.mint)
                        .onReceive(timer) { _ in
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                program.isPreparing = false
                            }
                        }
                        .animation(.linear, value: counter)
                }
            }
        }
    }
}

struct EmergencyButton: View {
    var body: some View {
        Button {
            // emergency action
        } label: {
            HStack {
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 120, height: 30, alignment: .top)
                        .foregroundColor(.red)
                        .overlay(Text("Emergency").foregroundColor(.white).fontWeight(.bold))
                }
            }
            
        }
    }
}

struct TrackingView_Previews: PreviewProvider {
    
    static var previews: some View {
        TrackingView(program: .init(program: Program(programName: nil,
                                                     duration: "",
                                                     description: "",
                                                     color: Pallete.noProgramColor,
                                                     emoji: "")))
            .previewInterfaceOrientation(.portrait)
    }
}
