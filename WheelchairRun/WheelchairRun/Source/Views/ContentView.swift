//
//  ContentView.swift
//  WheelchairRun
//
//  Created by Ayden on 2022/04/06.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @EnvironmentObject var store: MilgoStore
    var body: some View {
        switch store.state.homeAppState {
        case .none:
            HomeView()
        case .tracking:
            TrackingView(program: .init(program: store.state.selectedProgram))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        // TODO: 나스닥한테 아래 코드 의미 물어보기 - Preview에 넣으면 빌드에서는 작동하지 않는 코드인데 필요한가?
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

// TODO: 나스닥한테 아래 코드 의미 물어보기
//private let itemFormatter: DateFormatter = {
//    let formatter = DateFormatter()
//    formatter.dateStyle = .short
//    formatter.timeStyle = .medium
//    return formatter
//}()
