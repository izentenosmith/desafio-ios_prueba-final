//
//  ApiMarvelHeroDetail.swift
//  prueba-final
//
//  Created by Ignacio Zenteno on 21-12-24.
//

import Foundation

struct ApiMarvelHeroDetail: Identifiable, Codable {
    let id: Int
    let nombre: String
    let nombreReal: String
    let alias: [String]
    let poderes: [String]
    let primeraAparicion: String
    let historia: String
    let afiliaciones: [String]
    let imagen: String
} 