//
//  HomePageTest.swift
//  UIKitCatalogUITests
//
//  Created by Elif Bilge Parlak on 28.07.2023.
//  Copyright © 2023 Apple. All rights reserved.
//

import XCTest

final class HomePageTest: BaseClass {

    var homePageLocators = HomePage()
    
    func redirectToSwitch() throws {
        do{
            homePageLocators.navigateToSwitches()
        }catch{
            print("Error encountered")
        }
       
    }
}
