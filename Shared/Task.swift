//
//  Task.swift
//  BuildYourTime
//
//  Created by Mélissa Kintz on 20/06/2023.
//

import Foundation
import SwiftData

@Model final class Task {
    @Attribute(.unique) var id: UUID
    var name : String
    var createdAt: Date
    var completedAt: Date?
    var dueDate: Date?
    var timeSpent: Int?
    
    var project: Project?
    
    @Relationship()
    var subTasks: [Task] = []
    
    init(id: UUID = UUID(), createdAt: Date = .now, name: String) {
        self.createdAt = createdAt
        self.name = name
        self.id = id
    }
}

extension Task {
    static var preview: Task {
        let task = Task(name: "Task One")
        return task
    }
    
    var isCompleted: Bool {
        return completedAt == nil
    }
    
    var formatedSpentTime: String? {
        if let timeSpent {
            let formatter = DateComponentsFormatter()
            formatter.allowedUnits = [.hour, .minute, .second]
            formatter.unitsStyle = .short
            if let formattedString = formatter.string(from: TimeInterval(timeSpent)) {
                return formattedString
            }
        }
        return ""
    }
}
