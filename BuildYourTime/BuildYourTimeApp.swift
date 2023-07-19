//
//  BuildYourTimeApp.swift
//  BuildYourTime
//
//  Created by Mélissa Kintz on 20/06/2023.
//

import SwiftUI
import SwiftData

@main
struct BuildYourTimeApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Project.self, Task.self])
    }
}
