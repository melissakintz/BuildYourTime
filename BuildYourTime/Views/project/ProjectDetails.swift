//
//  ProjectItemView.swift
//  BuildYourTime
//
//  Created by Mélissa Kintz on 21/06/2023.
//

import SwiftUI
import SwiftData

struct ProjectDetails: View {
    @Environment(\.modelContext) private var modelContext
    @State private var name = ""
    
    var project: Project
    @Binding var selectedTask: Task?

    
    var body: some View {
        
        
        Grid(alignment: .leading,  horizontalSpacing: 10, verticalSpacing: 8) {
            GridRow{
                Text("Name")
                    .foregroundColor(.gray)
                TextField("Name", text: $name)
                    .onSubmit {
                        project.name = name
                    }
            }
            Divider()
            GridRow {
                Text("Created at")
                    .foregroundColor(.gray)
                Text(project.createdAt.formatted())
            }
        }
        .padding()
        List{
            Section("To do") {
                ForEach(project.tasks.sorted(by: { $0.createdAt > $1.createdAt })){ task in
                    NavigationLink(destination: TaskView(task: task)) {
                        TaskRow(task: task)
                    }
                }
                .onDelete(perform: deleteItems)
                AddTaskView(project: project)
            }
        }
        .onAppear {
            name = project.name
        }
        .onChange(of: project) {
            name = project.name
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(project.tasks.sorted(by: { $0.createdAt > $1.createdAt })[index])
            }
        }
    }
}

#Preview {
    ProjectDetails(project: .preview, selectedTask: .constant(nil))
    
}

