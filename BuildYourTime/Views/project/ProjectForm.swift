//
//  AddProjectView.swift
//  BuildYourTime
//
//  Created by Mélissa Kintz on 21/06/2023.
//

import SwiftUI

struct ProjectForm: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    var project : Project?
    
    @State private var name = ""
    
    enum Field: Hashable {
        case nameField
    }
    @FocusState private var focusedField: Field?
    
    
    var body: some View {
        Form {
            TextField("Name", text: $name)
                .submitScope()
                .focused($focusedField, equals: .nameField)
                .onSubmit {
                    addProject()
                }
        }
        .defaultFocus($focusedField, .nameField)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button("Done") {
                    addProject()
                    dismiss()
                }
            }
        }
        .onAppear {
            name = project?.name ?? ""
            focusedField = .nameField
        }
    }
    
    private func addProject () {
        if name == "" {
            return
        }
        withAnimation {
            if let project  {
                project.name = name
            } else {
                let newProject = Project(name: name)
                modelContext.insert(newProject)
            }
        }
    }
}

#Preview {
    MainActor.assumeIsolated {
        NavigationStack {
            ProjectForm().modelContainer(PreviewSampleData.container)
        }
    }
}
