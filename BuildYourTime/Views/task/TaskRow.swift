//
//  TaskItemView.swift
//  BuildYourTime
//
//  Created by Mélissa Kintz on 21/06/2023.
//

import SwiftUI
import Observation


struct TaskRow: View {
    var task: Task
    
    var body: some View {
        HStack {
            CheckBoxView(task: task)
            VStack(alignment: .leading){
                Text(task.name)
                HStack {
                    if let
                        _ = task.timeSpent, let formatedSpentTime = task.formatedSpentTime  {
                        HStack(spacing: 0) {
                            Text("Time spent: ")
                            Text(formatedSpentTime)
                        }
                        
                    }
                    if task.subTasks.count > 0 {
                        HStack(spacing: 0) {
                            Text("Sub tasks: ")
                            Text(task.subTasks.count.description)
                        }
                    }
                    
                }
                .font(.caption)
                .foregroundColor(.gray)
            }
            
            Spacer()
            TimerButtonView(task: task)
        }
    }
}

#Preview {
    MainActor.assumeIsolated {
        List {
            TaskRow(task: .preview)
                .modelContainer(PreviewSampleData.container)
        }
    }
}

