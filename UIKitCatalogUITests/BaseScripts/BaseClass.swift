//
//  BaseClass.swift
//  UIKitCatalogUITests
//
//  Created by Elif Bilge Parlak on 28.07.2023.
//  Copyright © 2023 Apple. All rights reserved.
//

import Foundation
import XCTest

class BaseClass : XCTestCase{
    
    public let app = XCUIApplication()
    
    override func setUp() {
        app.launch()
    }
    
    override func tearDown() {
        app.terminate()
    }
}

