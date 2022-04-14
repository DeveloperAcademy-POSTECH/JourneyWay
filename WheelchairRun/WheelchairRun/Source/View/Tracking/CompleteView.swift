//
//  CompleteView.swift
//  WheelchairRun
//
//  Created by Noah Park on 2022/04/13.
//

import SwiftUI

struct CompleteView: View {
    @State var date: Date = Date()
    @ObservedObject var program: TrackingViewState
    @Binding var isPresented: Bool
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: ProgramRecord.entity(), sortDescriptors: [])
    var request: FetchedResults<ProgramRecord>
    
    var body: some View {
        VStack {
            Spacer(minLength: 50)
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Pallete.Gradient.purple)
                    .padding(20)
                    .frame(height: 580)
                    .shadow(radius: 10)
                VStack {
                    Text("🎉")
                        .font(.system(size: 70).bold())
                    Text("축하합니다!")
                        .font(.system(size: 42).bold())
                        .foregroundColor(Pallete.mint)
                    VStack {
                        VStack {
                            Text("Time")
                                .fontWeight(.bold)
                                .underline()
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            HStack(alignment: .firstTextBaseline) {
                                Text(Program.secondsToHour(time: program.progressValue))
                                    .font(.system(size: 50).bold())
                                Text("h")
                                    .padding(.leading, -5)
                                    .font(.caption.bold())
                                    .foregroundColor(.white)
                                Text(Program.secondsToMinute(time: program.progressValue))
                                    .font(.system(size: 50).bold())
                                Text("m")
                                    .padding(.leading, -5)
                                    .font(.caption.bold())
                                    .foregroundColor(.white)
                                Text(Program.secondsToSecond(time: program.progressValue))
                                    .font(.system(size: 50).bold())
                                Text("s")
                                    .padding(.leading, -5)
                                    .font(.caption.bold())
                                    .foregroundColor(.white)
                            }
                            .padding(.bottom, 7)
                            .foregroundColor(Pallete.mint)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        VStack {
                            Text("Push")
                                .fontWeight(.bold)
                                .underline()
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            HStack(alignment: .firstTextBaseline) {
                                Text(String(format: "%d", Int(program.stats.pushCount)))
                                    .font(.system(size: 50).bold())
                                
                                    .foregroundColor(Pallete.mint)
                                Text("Count")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 7)
                        }
                        VStack {
                            Text("Distance")
                                .fontWeight(.bold)
                                .underline()
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            HStack(alignment: .firstTextBaseline) {
                                Text(String(format: "%.2f", program.stats.distance))
                                    .font(.system(size: 50).bold())
                                    .foregroundColor(Pallete.mint)
                                Text("km")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 7)
                        }
                    }
                    .padding(30)
                    .padding(.horizontal, 17)
                }
            }
            Button {
                isPresented = false
                addRecord()
                
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
        .onAppear {
            date = Date()
        }
    }
    
    private func addRecord() {
        let newRecord = ProgramRecord(context: viewContext)
        newRecord.pushDate = date
        newRecord.pushDuration = program.progressValue
        newRecord.pushCount = Int64(program.stats.pushCount)
        newRecord.pushDistance = program.stats.distance
        
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}


struct CompleteView_Previews: PreviewProvider {
    
    static var previews: some View {
        CompleteView(program: TrackingViewState(program: Program.dummy[0]), isPresented: .constant(true))            .previewInterfaceOrientation(.portrait)
    }
}
