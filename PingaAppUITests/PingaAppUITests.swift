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
        snapshot("0MainScreen")
        app.scrollViews.otherElements.buttons["Random Drink"].tap()
        snapshot("1RandomDrink")
        app.navigationBars["_TtGC7SwiftUI19UIHosting"]/*@START_MENU_TOKEN@*/.buttons["ReturnButton"]/*[[".buttons[\" Return\"]",".buttons[\"ReturnButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.scrollViews.otherElements.scrollViews["Cocktails"].otherElements.buttons["14029"].tap()
        snapshot("2Cocktail")
        //app.scrollViews.otherElements.staticTexts["Ingredients"].swipeUp()
        app.swipeUp()
        snapshot("3Cocktail_Bottom")
        
//        let app = XCUIApplication()
//        let scrollViewsQuery = app/*@START_MENU_TOKEN@*/.scrollViews/*[[".otherElements[\"MainScreenNavigation\"].scrollViews",".scrollViews"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
//        let element = scrollViewsQuery.otherElements.containing(.staticText, identifier:"Gin Fizz").children(matching: .other).element
//        element.swipeUp()
//        element.swipeUp()
//        element.swipeUp()
//        app/*@START_MENU_TOKEN@*/.navigationBars["_TtGC7SwiftUI19UIHosting"].buttons["ReturnButton"]/*[[".otherElements[\"MainScreenNavigation\"].navigationBars[\"_TtGC7SwiftUI19UIHosting\"]",".buttons[\" Return\"]",".buttons[\"ReturnButton\"]",".navigationBars[\"_TtGC7SwiftUI19UIHosting\"]"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.tap()
//
//        let elementsQuery = scrollViewsQuery.otherElements
//        elementsQuery.staticTexts["Alcoholic"].swipeUp()
//
//        let returnbuttonButton = app/*@START_MENU_TOKEN@*/.navigationBars["PingaApp"].buttons["ReturnButton"]/*[[".otherElements[\"MainScreenNavigation\"].navigationBars[\"PingaApp\"]",".buttons[\" Return\"]",".buttons[\"ReturnButton\"]",".navigationBars[\"PingaApp\"]"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/
//        returnbuttonButton.tap()
//        returnbuttonButton.tap()
//
//        let elementsQuery2 = elementsQuery.scrollViews["Cocktails"].otherElements
//        elementsQuery2/*@START_MENU_TOKEN@*/.buttons["14029"]/*[[".buttons[\"57 Chevy with a White License Plate\"]",".buttons[\"14029\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeLeft()
//        elementsQuery2/*@START_MENU_TOKEN@*/.buttons["178318"]/*[[".buttons[\"747 Drink\"]",".buttons[\"178318\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeLeft()
        

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
