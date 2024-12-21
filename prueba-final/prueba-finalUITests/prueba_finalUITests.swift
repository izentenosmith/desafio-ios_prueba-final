//
//  prueba_finalUITests.swift
//  prueba-finalUITests
//
//  Created by Ignacio Zenteno on 21-12-24.
//

import XCTest

final class prueba_finalUITests: XCTestCase {
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }
    
    func testCreateCustomHero() throws {
        // Navegar a "Mis Héroes"
        app.buttons["Mis Héroes"].tap()
        
        // Tocar el botón +
        app.buttons["plus"].tap()
        
        // Rellenar el formulario
        let heroNameTextField = app.textFields["Nombre del Héroe"]
        XCTAssertTrue(heroNameTextField.waitForExistence(timeout: 2))
        heroNameTextField.tap()
        heroNameTextField.typeText("Iron Man")
        
        let realNameTextField = app.textFields["Nombre Real"]
        realNameTextField.tap()
        realNameTextField.typeText("Tony Stark")
        
        let powersTextField = app.textFields["Poderes"]
        powersTextField.tap()
        powersTextField.typeText("Genio, millonario, playboy, filántropo")
        
        // Crear el héroe
        app.buttons["Crear"].tap()
        
        // Verificar que el héroe aparece en la lista
        let heroCell = app.staticTexts["Iron Man"]
        XCTAssertTrue(heroCell.waitForExistence(timeout: 2))
        
        // Verificar que también aparece el nombre real
        let realNameText = app.staticTexts["Tony Stark"]
        XCTAssertTrue(realNameText.exists)
    }
}