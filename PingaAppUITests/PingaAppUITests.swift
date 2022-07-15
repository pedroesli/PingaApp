//
//  PingaAppUITests.swift
//  PingaAppUITests
//
//  Created by Pedro Ésli Vieira do Nascimento on 15/07/22.
//

import XCTest

class PingaAppUITests: XCTestCase {

//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//
//        // In UI tests it is usually best to stop immediately when a failure occurs.
//        continueAfterFailure = false
//
//        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
    
    override func setUp() {
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()
    }

    func testScreenshot() throws {
        // UI tests must launch the application that they test.
        // snapshot("0Launch")
        
        let app = XCUIApplication()
        let backButton = app.navigationBars["_TtGC7SwiftUI19UIHosting"].buttons["Back"]
        
        app.buttons["Segunda tela"].tap()
        
        snapshot("0Launch")
        
        backButton.tap()
        
        snapshot("1Launch")
                

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
