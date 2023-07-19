//
//  ContentView.swift
//  BuildYourTime
//
//  Created by Mélissa Kintz on 20/06/2023.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var projects: [Project]
    
    @State var selectedProject: Project?
    @State var showAddProject: Bool = false
    
    var body: some View {
        NavigationSplitView {
            List(selection: $selectedProject) {
                ForEach(projects) { project in
                    NavigationLink(value: project) {
                        Text(project.name)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
#if os(iOS)
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
#endif
                ToolbarItem {
                    Button{
                        showAddProject = true
                    } label: {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddProject) {
                NavigationStack {
                    AddProjectView()
                }
            }
            Text("Select an item")
        } detail: {
            if let project = selectedProject {
                ProjectDetailsView(project: project)
            }else {
                Text("rien")
            }
        }
    }

    private func addItem() {
        withAnimation {
            let newproject = Project(name: "Marelis")
            modelContext.insert(newproject)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(projects[index])
            }
        }
    }
}


#Preview {
    MainActor.assumeIsolated {
        ContentView()
            .modelContainer(PreviewSampleData.container)
    }
}
