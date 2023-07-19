//
//  Project.swift
//  BuildYourTime
//
//  Created by Mélissa Kintz on 20/06/2023.
//

import Foundation
import SwiftData

@Model final class Project {
    @Attribute(.unique) var id: UUID
    var name : String
    var createdAt: Date
    
    @Relationship(.cascade, inverse: \Task.project)
    var tasks: [Task] = []
    
    
    init(id: UUID = UUID(), createdAt: Date = .init(), name: String) {
        self.id = id
        self.createdAt = createdAt
        self.name = name
    }
}

extension Project {
    static var preview: Project {
        let project = Project(name: "Pasha")
        project.tasks = [Task.preview]
        return project
    }
}
