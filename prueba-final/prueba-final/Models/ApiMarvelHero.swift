//
//  ApiMarvelHero.swift
//  prueba-final
//
//  Created by Ignacio Zenteno on 21-12-24.
//

import Foundation

struct ApiMarvelHero: Identifiable, Codable {
    let id: Int
    let nombre: String
    let primeraAparicion: String
    let imagen: String
}