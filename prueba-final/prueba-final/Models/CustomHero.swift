//
//  CustomHero.swift
//  prueba-final
//
//  Created by Ignacio Zenteno on 21-12-24.
//

import Foundation
import SwiftData

@Model
final class CustomHero: Identifiable, Hashable {
    var id: UUID
    var heroName: String
    var realName: String
    var powers: String
    var createdDate: Date
    
    init(id: UUID = UUID(), 
         heroName: String, 
         realName: String, 
         powers: String,
         createdDate: Date = Date()) {
        self.id = id
        self.heroName = heroName
        self.realName = realName
        self.powers = powers
        self.createdDate = createdDate
    }
    
    static func == (lhs: CustomHero, rhs: CustomHero) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
