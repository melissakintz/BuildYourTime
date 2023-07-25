//
//  TimerButtonView.swift
//  BuildYourTime
//
//  Created by Mélissa Kintz on 19/07/2023.
//

import SwiftUI

struct TimerButtonView: View {
    @State private var stopWatchManager = StopWatchManager()
    
    var task: Task

    var body: some View {
        Button {
            if(stopWatchManager.mode == .running) {
                stopWatchManager.pause()
                task.timeSpent = stopWatchManager.secondsElapsed
                stopWatchManager.stop()
            }else {
                stopWatchManager.start()
            }
        } label: {
            switch stopWatchManager.mode {
            case .stopped :
                Image(systemName: "timer")
            case .running:
                Text(stopWatchManager.secondsElapsed.formatted())
            case .paused:
                Image(systemName: "pause.circle.fill")
                    .symbolEffect(.pulse, isActive: true)
            }
        }
        .buttonStyle(BorderlessButtonStyle())
    }
}

#Preview {
    MainActor.assumeIsolated {
        List {
            TimerButtonView(task: .preview)
                .modelContainer(PreviewSampleData.container)
        }
    }
}
