//
//  prueba_finalTests.swift
//  prueba-finalTests
//
//  Created by Ignacio Zenteno on 21-12-24.
//

import XCTest
import SwiftData
@testable import prueba_final

@MainActor
final class prueba_finalTests: XCTestCase {
    var viewModel: CustomHeroViewModel!
    var modelContainer: ModelContainer!
    var modelContext: ModelContext!
    
    override func setUpWithError() throws {
        do {
            let config = ModelConfiguration(isStoredInMemoryOnly: true)
            let container = try ModelContainer(for: CustomHero.self, configurations: config)
            modelContext = ModelContext(container)
            viewModel = CustomHeroViewModel(modelContext: modelContext)
        } catch {
            XCTFail("Failed to create ModelContainer: \(error)")
        }
    }
    
    override func tearDownWithError() throws {
        viewModel = nil
        modelContext = nil
        modelContainer = nil
        try super.tearDownWithError()
    }
    
    func testAddHero() throws {
        // Given
        let heroName = "Spider-Man"
        let realName = "Peter Parker"
        let powers = "Trepar paredes, sentido arácnido"
        
        // When
        viewModel.addHero(heroName: heroName, realName: realName, powers: powers)
        
        // Then
        let descriptor = FetchDescriptor<CustomHero>(sortBy: [SortDescriptor(\.heroName)])
        let heroes = try modelContext.fetch(descriptor)
        
        XCTAssertEqual(heroes.count, 1)
        XCTAssertEqual(heroes.first?.heroName, heroName)
        XCTAssertEqual(heroes.first?.realName, realName)
        XCTAssertEqual(heroes.first?.powers, powers)
    }
}
