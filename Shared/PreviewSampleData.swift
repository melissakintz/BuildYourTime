/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
The preview sample data actor which provides an in-memory model container.
*/

import SwiftData
import SwiftUI

/**
 Preview sample data.
 */
actor PreviewSampleData {
    @MainActor
    static var container: ModelContainer = {
        let schema = Schema([Project.self, Task.self])
        // inMemory: true
        let configuration = ModelConfiguration(inMemory: true)
        let container = try! ModelContainer(for: schema, configurations: [configuration])
        let sampleData: [any PersistentModel] = [
            Project.preview, Task.preview
        ]
        sampleData.forEach {
            container.mainContext.insert($0)
        }
        return container
    }()
}
