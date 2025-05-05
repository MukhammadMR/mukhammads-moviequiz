//
//  MovieQuizUITests.swift
//  MovieQuizUITests
//
//  Created by Мухаммад Махмудов on 02.05.2025.
//

import XCTest

final class MovieQuizUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        app = XCUIApplication()
        app.launch()
        
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        app.terminate()
        app = nil
    }
    
    func testYesButton() {
        let firstPoster = app.images["Poster"]
        let secondPoster = app.images["Poster"]
        let firstPosterData = firstPoster.screenshot().pngRepresentation
        let secondPosterData = secondPoster.screenshot().pngRepresentation
        
        app.buttons["Yes"].tap()
        
        XCTAssertNotEqual(firstPosterData, secondPosterData)
    }
    
    func testNoButton() {
        
        let firstPoster = app.images["Poster"]
        let secondPoster = app.images["Poster"]
        let firstPosterData = firstPoster.screenshot().pngRepresentation
        let secondPosterData = secondPoster.screenshot().pngRepresentation
        let indexLabel = app.staticTexts["Index"]
        
        app.buttons["No"].tap()
       
        XCTAssertNotEqual(firstPosterData, secondPosterData)
        XCTAssertEqual(indexLabel.label, "1/10")
    }
    
    func testGameFinish() {
        let poster = app.images["Poster"]
        XCTAssertTrue(poster.waitForExistence(timeout: 5))
        let alert = app.alerts["Game results"]
        
        
        for _ in 1...10 {
            XCTAssertTrue(poster.waitForExistence(timeout: 5))
            app.buttons["No"].tap()
        }
        
        XCTAssertTrue(alert.exists)
        XCTAssertTrue(alert.label == "Этот раунд окончен!")
        XCTAssertTrue(alert.buttons.firstMatch.label == "Сыграть ещё раз")
    }

    func testAlertDismiss() {
        let noButton = app.buttons["No"]
        let alert = app.alerts["Game results"]
        let indexLabel = app.staticTexts["Index"]
        
        sleep(5)
        for _ in 1...10 {
            XCTAssertTrue(noButton.waitForExistence(timeout: 20))
            noButton.tap()
        }
        
        XCTAssertTrue(alert.waitForExistence(timeout: 5))
        alert.buttons["Сыграть ещё раз"].tap()
        
        sleep(2)
        
        XCTAssertFalse(alert.exists)
        XCTAssertTrue(indexLabel.label == "1/10")
    }
}
