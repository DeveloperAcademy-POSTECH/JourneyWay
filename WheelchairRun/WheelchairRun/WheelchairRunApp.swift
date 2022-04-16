//
//  WheelchairRunApp.swift
//  WheelchairRun
//
//  Created by Ayden on 2022/04/06.
//

import SwiftUI

@main
struct WheelchairRunApp: App {
    let persistenceController = PersistenceController.shared
    let store = MilgoStore(
        initial: MilgoState(selectedProgram: Program.none),
        reducer: milgoReducer
    )
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(store)
        }
    }
}
