//
//  TestExecution.swift
//  UIKitCatalogUITests
//
//  Created by Elif Bilge Parlak on 28.07.2023.
//  Copyright © 2023 Apple. All rights reserved.
//

import XCTest

final class TestExecution: BaseClass {
    
    var homePageTest = HomePageTest()
    
    func testRunner() throws{
        do{
            super.setUp()
            try homePageTest.redirectToSwitch()
            super.tearDown() 
        }catch{
            print("Error occurred - Runner ")
        }
    }
}
