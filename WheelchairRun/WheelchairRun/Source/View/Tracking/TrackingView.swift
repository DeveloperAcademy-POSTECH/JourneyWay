//
//  TrackingView.swift
//  WheelchairRun
//
//  Created by Noah Park on 2022/04/06.
//

import SwiftUI
import Combine

struct TrackingView: View {
    @ObservedObject var program: ProgramState
    @Binding var isPresented: Bool
    @State var counter: Double = 4.0
    
    private let timer = Timer.publish(every: 0.1, tolerance: 0.01, on: .main, in: .common).autoconnect()
    private let readyText: [String] = ["How is your condition?",
                               "Checked road safety?",
                               "Now, shall we run?"]
    
    
    
    init(program: Program, isPresented: Binding<Bool>) {
        self._isPresented = isPresented
        _program = ObservedObject(wrappedValue: ProgramState(program: program))
    }
    
    var body: some View {
        ZStack {
            if !program.isPreparing {
                VStack {
                    if !program.isComplete {
                        EmergencyButton()
                            .padding()
                        Text(program.program.mentor?.name ?? "Free Running")
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
                        CompleteView(program: program, isPresented: $isPresented)
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

struct CompleteView: View {
    @ObservedObject var program: ProgramState
    @Binding var isPresented: Bool
    
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
                Text(Program.secondsToTime(time: program.progressValue))
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical, 5)
            VStack {
                Text("Distance")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(String(format: "%.2f", program.program.stats.distance))
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical, 5)
            VStack {
                Text("Push")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(String(format: "%d", Int(program.program.stats.pushCount)))
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical, 5)
        }
        .padding(50)
        Spacer()
        Button {
            isPresented = false
        } label: {
            Circle()
                .foregroundColor(.black)
                .overlay(Image(systemName: "checkmark")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25)
                    .foregroundColor(Pallete.mint))
                .frame(width: 100, height: 100)
                .padding()
        }
        Spacer()
    }
}

struct ProgramProgressBar: View {
    @ObservedObject var program: ProgramState
    let timer: Publishers.Autoconnect<Timer.TimerPublisher>
    let lineWidth = 15.0
    
    var body: some View {
        let duration = program.player?.duration ?? 0.0
        ZStack {
            Circle()
                .stroke(lineWidth: lineWidth)
                .opacity(0.3)
                .foregroundColor(Pallete.purple)
            Circle()
                .trim(from: 0.0, to: CGFloat(min(Float(program.progressValue) / Float(duration), 1.0)))
                .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
                .foregroundColor(Pallete.purple)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear, value: program.progressValue)
            VStack {
                Text(Program.secondsToTime(time: program.progressValue))
                    .font(.largeTitle)
                    .bold()
                    .onReceive(timer) { _ in
                        if program.player?.isPlaying != false {
                            if program.isRunning {
                                program.updateProgressValue(time: program.player?.currentTime ?? 0.0)
                                program.updateStats_test()
                            }
                        } else if program.player?.currentTime == 0.0 {
                            timer.upstream.connect().cancel()
                            program.markComplete()
                            program.player?.stop()
                        }
                    }
                Text("/ \(Program.secondsToTime(time: duration))")
                    .fontWeight(.bold)
            }
        }
        .frame(maxWidth: 300, maxHeight: 300)
    }
}

struct StatsInfoModule: View {
    @ObservedObject var program: ProgramState
    
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Text(String(format: "%.2f", program.program.stats.distance))
                    .font(.title)
                    .fontWeight(.bold)
                Text("KM")
                    .font(.caption)
            }.frame(width: 100)
            Spacer()
            VStack {
                Text(String(format: "%d", Int(program.program.stats.pushCount)))
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
    @ObservedObject var program: ProgramState
    
    var body: some View {
        HStack {
            if !program.isRunning {
                Button {
                    program.isComplete = true
                    program.player?.stop()
                } label: {
                    Circle()
                        .foregroundColor(.black)
                        .overlay(Image(systemName: "stop.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25)
                            .foregroundColor(Pallete.mint))
                        .frame(width: 100, height: 100)
                        .padding()
                }
            }
            Button {
                program.toggleRunningStatus()
                if program.isRunning {
                    program.player?.play()
                } else {
                    program.player?.pause()
                }
            } label: {
                Circle()
                    .foregroundColor(.black)
                    .overlay(Image(systemName: program.isRunning ? "pause.fill" : "chevron.right")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25)
                        .foregroundColor(Pallete.mint))
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
        TrackingView(program: Program.dummy[0], isPresented: .constant(false))
            .previewInterfaceOrientation(.portrait)
    }
}
