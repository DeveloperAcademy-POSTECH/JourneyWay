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
    @ObservedObject var program: TrackingViewState
    @Binding var isPresented: Bool
    @State var counter: Double = 4.0
    
    private let timer = Timer.publish(every: 0.1, tolerance: 0.01, on: .main, in: .common).autoconnect()
    private let readyText: [String] = ["How is your condition?",
                                       "Checked road safety?",
                                       "Now, shall we run?"]
    
    
    init(program: Program, isPresented: Binding<Bool>) {
        self._isPresented = isPresented
        _program = ObservedObject(wrappedValue: TrackingViewState(program: program))
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
