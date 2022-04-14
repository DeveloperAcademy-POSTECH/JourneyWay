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
