//
//  TrackingView.swift
//  WheelchairRun
//
//  Created by Noah Park on 2022/04/06.
//

import SwiftUI

struct VoiceMentor<TimeType> where TimeType: BinaryInteger {
    let mentorName: String
    let playbackTime: TimeType
    var isRunning: Bool = true
    var progressValue: Int = 0
    var stats: ExerciseStats = ExerciseStats()
    var isComplete: Bool = false
    
    static func secondsToTime(time: TimeType) -> String {
        let (h,m,s) = (time / 3600, (time % 3600) / 60, (time % 3600) % 60)
        let h_string = h < 10 ? "0\(h)" : "\(h)"
        let m_string =  m < 10 ? "0\(m)" : "\(m)"
        let s_string =  s < 10 ? "0\(s)" : "\(s)"
        
        return "\(h_string):\(m_string):\(s_string)"
    }
    
    mutating func toggleRunningStatus() {
        isRunning.toggle()
    }
    
    mutating func countSeconds() {
        progressValue += 1
    }
    
    mutating func updateStats_test(pushUpdate: Float, distanceUpdate: Float) {
        stats.pushCount += pushUpdate
        stats.distance += distanceUpdate
    }
    
    mutating func markComplete() {
        isComplete = true
    }
    
    struct ExerciseStats {
        var pushCount: Float = 0.0
        var distance: Float = 0.0
    }
}

class DummyProgram: ObservableObject {
    @Published private var model = VoiceMentor<Int>(mentorName: "Voice Walking Test",
                                                    playbackTime: 10)
    var mentorName: String { model.mentorName }
    var playbackTime: Int { model.playbackTime }
    var isRunning: Bool { model.isRunning }
    var stats: VoiceMentor<Int>.ExerciseStats { model.stats }
    var progressValue: Int { model.progressValue }
    var isComplete: Bool { model.isComplete }
    
    func toggleRunningStatus() {
        model.toggleRunningStatus()
    }
    
    func countSecond() {
        model.countSeconds()
    }
    
    func updateStats_test() {
        model.updateStats_test(pushUpdate: 0.6, distanceUpdate: 0.0012)
    }
    
    func markComplete() {
        model.markComplete()
    }
}


struct TrackingView: View {
    @ObservedObject var program = DummyProgram()
    
    var body: some View {
        VStack {
            if !program.isComplete {
                EmergencyButton()
                    .padding()
                Text(program.mentorName)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .lineLimit(1)
                    .padding()
                ProgramProgressBar(program: program)
                    .padding(30)
                StatsInfoModule(program: program)
                Spacer(minLength: 50)
                PlayBackController(program: program)
            } else {
                CompleteView(program: program)
            }
        }
    }
}

struct CompleteView: View {
    @ObservedObject var program: DummyProgram
    
    var body: some View {
        Spacer()
        Text("Congratulation!")
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding()
        Spacer()
        VStack {
            VStack {
                Text("Time")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(VoiceMentor<Int>.secondsToTime(time: program.progressValue))
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical, 5)
            VStack {
                Text("Distance")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(String(format: "%.2f", program.stats.distance))
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical, 5)
            VStack {
                Text("Push")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(String(format: "%d", Int(program.stats.pushCount)))
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical, 5)
        }
        .padding(50)
        Spacer()
        Button {
            // Back To Home
        } label: {
            Circle()
                .foregroundColor(.black)
                .overlay(Image(systemName: "checkmark")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25)
                    .foregroundColor(.green))
                .frame(width: 100, height: 100)
                .padding()
        }
        Spacer()
    }
}

struct ProgramProgressBar: View {
    @ObservedObject var program: DummyProgram
    let timer = Timer.publish(every: 1, tolerance: 0.05, on: .main, in: .common).autoconnect()
    let lineWidth = 15.0
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: lineWidth)
                .opacity(0.3)
                .foregroundColor(Color.purple)
            Circle()
                .trim(from: 0.0, to: CGFloat(min(Float(program.progressValue) / Float(program.playbackTime), 1.0)))
                .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.purple)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear, value: program.progressValue)
            VStack {
                Text(VoiceMentor<Int>.secondsToTime(time: program.progressValue))
                    .font(.largeTitle)
                    .bold()
                    .onReceive(timer) { _ in
                        if program.progressValue < program.playbackTime {
                            if program.isRunning {
                                program.countSecond()
                                program.updateStats_test()
                            }
                        } else {
                            timer.upstream.connect().cancel()
                            program.markComplete()
                        }
                    }
                Text("/ \(VoiceMentor.secondsToTime(time: program.playbackTime))")
                    .fontWeight(.bold)
            }
        }
        .frame(maxWidth: 300, maxHeight: 300)
    }
}

struct StatsInfoModule: View {
    @ObservedObject var program: DummyProgram
    
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Text(String(format: "%.2f", program.stats.distance))
                    .font(.title)
                    .fontWeight(.bold)
                Text("KM")
                    .font(.caption)
            }.frame(width: 100)
            Spacer()
            VStack {
                Text(String(format: "%d", Int(program.stats.pushCount)))
                    .font(.title)
                    .fontWeight(.bold)
                Text("Push")
                    .font(.caption)
            }.frame(width: 100)
            Spacer()
        }
    }
}

struct PlayBackController: View {
    @ObservedObject var program: DummyProgram
    
    var body: some View {
        HStack {
            if !program.isRunning {
                Button {
                    
                } label: {
                    Circle()
                        .foregroundColor(.black)
                        .overlay(Image(systemName: "stop.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25)
                            .foregroundColor(.green))
                        .frame(width: 100, height: 100)
                        .padding()
                }
            }
            Button {
                program.toggleRunningStatus()
            } label: {
                Circle()
                    .foregroundColor(.black)
                    .overlay(Image(systemName: program.isRunning ? "pause.fill" : "chevron.right")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25)
                        .foregroundColor(.green))
                    .frame(width: 100, height: 100)
                    .padding()
                    .animation(.linear, value: program.isRunning)
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
        TrackingView()
            .previewInterfaceOrientation(.portrait)
    }
}
