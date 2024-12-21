import SwiftUI
import SwiftData

@main
struct BibliotecaDeDatosApp: App {
    let container: ModelContainer
    
    init() {
        do {
            let schema = Schema([CustomHero.self])
            let modelConfiguration = ModelConfiguration(schema: schema)
            container = try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not initialize ModelContainer: \(error)")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(container)
    }
}