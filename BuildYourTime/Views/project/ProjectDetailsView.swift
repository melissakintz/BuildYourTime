//
//  ProjectItemView.swift
//  BuildYourTime
//
//  Created by Mélissa Kintz on 21/06/2023.
//

import SwiftUI

struct ProjectDetailsView: View {
    @State var project: Project
    
    @State private var name = ""
    
    var body: some View {
        List {
            Section("Details") {
                Grid(alignment: .leading,  horizontalSpacing: 10, verticalSpacing: 8) {
                    GridRow{
                        Text("Name")
                            .foregroundColor(.gray)
                        TextField("Name", text: $name)
                    }
                    Divider()
                    GridRow {
                        Text("Created at")
                            .foregroundColor(.gray)
                        Text(project.createdAt.formatted())
                    }
                }
            }
            Section("To do") {
                ForEach(project.tasks.sorted(by: { $0.createdAt > $1.createdAt })){ task in
                    TaskItemView(task: task)
                }
                AddTaskView(project: project)
                
            }
            
        }
        .onAppear {
            name = project.name
        }
    }
}

#Preview {
        ProjectDetailsView(project: .preview)
    
}
