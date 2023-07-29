//
//  UIKitCatalogUITests.swift
//  UIKitCatalogUITests
//
//  Created by Elif Bilge Parlak on 27.07.2023.
//  Copyright © 2023 Apple. All rights reserved.
//

import XCTest//An abstarct base class for creating, managing and executing tests.

final class UIKitCatalogUITests: XCTestCase { //XCTestCase: The primary class for defining test cases, test methods and performance tests.
    // if you want to implement the ui functionality
    let app = XCUIApplication()//extends XUIElement class, XCUIApplication is the root element at the app hieararchy.



    override func setUpWithError() throws {

        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }

    func testExample() throws {
        let app = XCUIApplication()// A proxy that can launch monitor and terminate a test application.
        app.launch()
        
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"Buttons")/*[[".cells.containing(.staticText, identifier:\"ButtonViewController\")",".cells.containing(.staticText, identifier:\"Buttons\")"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.children(matching: .other).element(boundBy: 0).children(matching: .other).element.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Person"]/*[[".cells.buttons[\"Person\"]",".buttons[\"Person\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Buttons"].buttons["UIKitCatalog"].tap()
                                 
        }

    //Using debugging mode write a basic script
    func testExample1(){
        app.launch()
        print("App Launched")
        app.staticTexts["Alert Views"].tap()
        app.staticTexts["Simple"].tap()
        app.buttons["OK"].tap()
        app.staticTexts["Okay / Cancel"].tap()
        app.buttons["Cancel"].tap()
    
    }
    
    //Handling single searchBox & textFields using boundBy
    func testExample2() throws{
        app.launch()
        app.staticTexts["Search"].tap()
        app.staticTexts["Default"].tap()
        sleep(5)
        
        app.searchFields.element.tap()//if there are single search field use element
        app.searchFields.element.typeText("Elif Bilge")
    }
    
    //Handling multiple searchBox & textFields using boundBy
    func testExample3() throws{
        app.launch()
        app.staticTexts["Text Fields"].tap()
        app.textFields.element(boundBy: 1).tap() //2. elementi seçer
        app.textFields.element(boundBy: 1).typeText("Elif")
    }
    
    //handling Date Picker using other elements concept
    func testExample4() throws {
        app.launch()
        app.staticTexts["Date Picker"].tap()
        sleep(5)
        app.buttons["Date and Time Picker"].tap()
        //artık bu buton olmuş other element değil ama other element olsaydı:
        //app.otherElements["Date and Time Picker"].tap()
    }
    
    //handling picker view using adjust
    func testExample5(){
        app.launch()
        app.staticTexts["Picker View"].tap()
       // sleep(5)
        app.pickerWheels["Red color component value"].adjust(toPickerWheelValue: "120")
        app.pickerWheels["Green color component value"].adjust(toPickerWheelValue: "255")
        app.pickerWheels["Blue color component value"].adjust(toPickerWheelValue: "120")
    }
    
    //handling picker view using adjust
    func testExample52(){
        app.launch()
        app.staticTexts["Picker View"].tap()
       // sleep(5)
        app.pickerWheels["Red color component value"].adjust(toPickerWheelValue: "120")
        app.pickerWheels["Green color component value"].adjust(toPickerWheelValue: "255")
        app.pickerWheels["Blue color component value"].adjust(toPickerWheelValue: "120")
        
        app.pickerWheels.element(boundBy: 1).adjust(toPickerWheelValue: "155")
    }
    
    //handling slider view using adjust
    func testExample6() throws{
        app.launch()
        app.staticTexts["Sliders"].tap()
        app.sliders["%42"].adjust(toNormalizedSliderPosition: 0.9)
        app.sliders.element(boundBy: 1).adjust(toNormalizedSliderPosition: 0.75)
        app.sliders["%84"].adjust(toNormalizedSliderPosition: 0.9)
        app.sliders.element(boundBy: 3).adjust(toNormalizedSliderPosition: 0.75)
    }
    
    //handling switches using first match and other elements handling
    func testExample7(){
        app.launch()
        app.staticTexts["Switches"].tap()
        app.switches.firstMatch.tap()
        app.switches.element(boundBy: 1).tap()
    }
    
    //steppers
    func testExample8() throws{
        app.launch()
        app.staticTexts["Steppers"].tap()
        sleep(4)
    }
    
    //Assertions
    func testExample9()throws{
        app.launch()
        print()
        sleep(4)
        //XCTAssert(app.staticTexts["demo"].exists,"optional exceptions")
        XCTAssertNoThrow("Demo error")
    }
    
    //delete on textfield
    func testExample10() throws{
        app.launch()
        app.staticTexts["Text Fields"].tap()
        app.textFields.element(boundBy: 1).tap()
        app.textFields.element(boundBy: 1).typeText("Demo")
        
        //delete character by character
       /* for i in 1...5{
            app.keys["delete"].tap()
        }*/
        
        //delete all the caharacters in 1 shot
        app.textFields.element(boundBy: 1).press(forDuration: 1.2)
        app.menuItems["Select All"].tap()
        app.keys["delete"].tap()
        sleep(3)
        
        
    }
    
    //Scroll up down
    func testExample11(){
        app.launch()
        app.swipeUp()
        sleep(4)
        app.swipeDown()
        sleep(4)
        //app.swipeLeft()
        //sleep(4)
        //app.swipeRight()
    }
    
    func testExample12(){
        app.launch()
        app.staticTexts["Switches"].waitForExistence(timeout: 10)//elementlerin yüklenmesi zaman alabilir
        app.staticTexts["Page Control"].tap()
        sleep(2)
        app.pageIndicators.element(boundBy: 0).swipeRight()
        sleep(2)
        app.pageIndicators.element(boundBy: 0).swipeLeft()
        
    }
    
    //browser launch
    func testExample13(){
        let app = XCUIApplication(bundleIdentifier: "com.apple.mobilesafari")
        app.launch()
        sleep(3)
        app.textFields["Adres"].tap()
        app.textFields["Adres"].typeText("www.elifbilgeparlak.com")
        app.buttons["Go"].tap()

        
    }
}
