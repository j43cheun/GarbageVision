//
//  GarbageVisionApp.swift
//  GarbageVision
//
//  Created by Justin Cheung on 12/24/20.
//

import SwiftUI

@main
struct GarbageVisionApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
