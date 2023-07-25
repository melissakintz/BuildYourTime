//
//  SubTaskForm.swift
//  BuildYourTime
//
//  Created by Mélissa Kintz on 19/07/2023.
//

import SwiftUI

struct SubTaskForm: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    var task: Task
    
    @State private var name = ""
    
    var body: some View {
        HStack {
            TextField("Subtask name", text: $name)
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
            
            task.subTasks.append(newTask)
            name = ""
        }
    }
}

#Preview {
    SubTaskForm(task: .preview)
}
