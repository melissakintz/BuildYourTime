//
//  TaskView.swift
//  BuildYourTime
//
//  Created by Mélissa Kintz on 19/07/2023.
//

import SwiftUI

struct TaskView: View {
    var task: Task

    var body: some View {
        VStack {
                Text(task.name)
            List {
                ForEach(task.subTasks) {subTask in
                    TaskRow(task: subTask)
                }
                SubTaskForm(task: task)
            }
        }
        .toolbar {
            ToolbarItem{
                TimerButtonView(task: task)
            }
        }
    }
}

#Preview {
    MainActor.assumeIsolated {
        TaskView(task: .preview)
            .modelContainer(PreviewSampleData.container)
    }
}
