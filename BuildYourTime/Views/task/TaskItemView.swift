//
//  TaskItemView.swift
//  BuildYourTime
//
//  Created by Mélissa Kintz on 21/06/2023.
//

import SwiftUI
import Observation


struct TaskItemView: View {
    
    var task: Task
    
    var body: some View {
        HStack {
            CheckBoxView(task: task)
            VStack(alignment: .leading){
                Text(task.name)
                if let
                    _ = task.timeSpent, let formatedSpentTime = task.formatedSpentTime  {
                    HStack(spacing: 0) {
                        Text("Time spent: ")
                        Text(formatedSpentTime)
                    }
                    .font(.caption)
                    .foregroundColor(.gray)
                }
            }
            Spacer()
            TimerButtonView(task: task)

        }
    }
}

#Preview {
    MainActor.assumeIsolated {
        List {
            TaskItemView(task: .preview)
                .modelContainer(PreviewSampleData.container)
        }
    }
}
