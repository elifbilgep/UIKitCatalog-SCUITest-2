//
//  HomePage.swift
//  UIKitCatalogUITests
//
//  Created by Elif Bilge Parlak on 28.07.2023.
//  Copyright © 2023 Apple. All rights reserved.
//

import XCTest

//creating objectr and customising objects in this class
final class HomePage: BaseClass {

    private lazy var switchOption = app.staticTexts["Switches"]// object
    
    func navigateToSwitches(){//object function
        switchOption.waitForExistence(timeout: 10)
        if switchOption.exists{
            switchOption.tap()
        }
    }
    
}
