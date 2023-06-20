//
//  BuildYourTime2App.swift
//  BuildYourTime2
//
//  Created by Mélissa Kintz on 20/06/2023.
//

import SwiftUI
import SwiftData

@main
struct BuildYourTime2App: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Item.self)
    }
}
