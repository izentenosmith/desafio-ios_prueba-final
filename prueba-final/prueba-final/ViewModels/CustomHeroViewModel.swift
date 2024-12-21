import SwiftData
import SwiftUI

@MainActor
class CustomHeroViewModel: ObservableObject {
    let modelContext: ModelContext
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    func addHero(heroName: String, realName: String, powers: String) {
        let hero = CustomHero(
            heroName: heroName,
            realName: realName,
            powers: powers
        )
        modelContext.insert(hero)
        try? modelContext.save()
    }
    
    func updateHero(_ hero: CustomHero, heroName: String, realName: String, powers: String) {
        hero.heroName = heroName
        hero.realName = realName
        hero.powers = powers
        try? modelContext.save()
    }
    
    func deleteHero(_ hero: CustomHero) {
        modelContext.delete(hero)
        try? modelContext.save()
    }
} 