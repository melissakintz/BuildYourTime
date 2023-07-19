//
//  CheckBoxView.swift
//  BuildYourTime
//
//  Created by Mélissa Kintz on 22/06/2023.
//

import SwiftUI

struct CheckBoxView: View {
    @State var task: Task
    var body: some View {
        Button {
            if (task.completedAt != nil){
                task.completedAt = nil
            }else {
                task.completedAt = .now
            }
        } label: {
            Image(systemName: task.isCompleted ? "circle" : "largecircle.fill.circle")
        }
        .buttonStyle(BorderlessButtonStyle())
    }
}


    
#Preview {
    MainActor.assumeIsolated {
        CheckBoxView(task: .preview)
            .modelContainer(PreviewSampleData.container)
        
    }
}
