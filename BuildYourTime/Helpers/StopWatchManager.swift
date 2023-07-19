//
//  Timer.swift
//  BuildYourTime
//
//  Created by Mélissa Kintz on 19/07/2023.
//

import Foundation
import Observation

@Observable
class StopWatchManager {
    enum stopWatchMode {
        case running
        case paused
        case stopped
    }
    
    var mode: stopWatchMode = .stopped
    var secondsElapsed = 0
    private var timer = Timer()
    
    func start(){
        mode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            self.secondsElapsed += 1
        }
    }
    
    func pause() {
        timer.invalidate()
        mode = .paused
    }
    
    func stop() {
        timer.invalidate()
        secondsElapsed = 0
        mode = .stopped
    }
}
