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

    var body: some Scene {
        WindowGroup {
            VoiceCardPopupView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
