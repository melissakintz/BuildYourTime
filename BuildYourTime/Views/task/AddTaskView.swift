//
//  AddTaskView.swift
//  BuildYourTime
//
//  Created by Mélissa Kintz on 22/06/2023.
//

import SwiftUI

struct AddTaskView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @State private var name = ""
    
    var project: Project
    
    var body: some View {
        HStack {
            TextField("Task name", text: $name)
                .onSubmit {
                    addTask()
                }
            Button {
                addTask()
            } label: {
                Image(systemName: "plus.circle")
            }
        }
    }
    
    private func addTask () {
        if name == "" {
            return
        }
        withAnimation {
            let newTask = Task(name: name)
            newTask.project = project
            modelContext.insert(newTask)
            name = ""
        }
    }
}

#Preview {
    MainActor.assumeIsolated {
        AddTaskView(project: .preview).modelContainer(PreviewSampleData.container)
    }
    
}
