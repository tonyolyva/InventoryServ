//
//  BasicUITest.swift
//  InventoryServ
//

import XCTest

@MainActor
final class BasicUITest: XCTestCase {
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // Launch the application we want to test.
        let launchExpectation = XCTestExpectation(description: "App launched")
        
        Task.detached { @MainActor in
            let app = XCUIApplication() // Initialize XCUIApplication on the main actor
            app.launch()
            launchExpectation.fulfill()
        }
        
        wait(for: [launchExpectation], timeout: 5) // Use synchronous wait
    }
    
    func testAppLaunches() throws {
        let app = XCUIApplication()
        XCTAssertTrue(app.state == .runningForeground, "App should be running in the foreground")
    }
    
    func testLabelExists() throws {
        let app = XCUIApplication()
        sleep(2) // Wait for 2 seconds (TEMPORARY)
        let welcomeLabel = app.staticTexts["welcomeLabel"]
        XCTAssertTrue(welcomeLabel.exists, "Welcome label should be visible")
    }
    
    func testButtonTapAndTextChange() throws {
        func testButtonTapAndTextChange() throws {
            let app = XCUIApplication()
            sleep(2) // Wait for 2 seconds (TEMPORARY)
            let myButton = app.buttons["myButton"]
            XCTAssertTrue(myButton.exists, "My button should be visible")
            
            // Tap the button
            myButton.tap()
            
            // Assuming tapping the button changes the text of a label with identifier "statusLabel"
            let statusLabel = app.staticTexts["statusLabel"]
            XCTAssertEqual(statusLabel.label, "Button Tapped", "Status label should change after button tap")
        }
    }
    
    func testItemLabelExists() throws {
        let app = XCUIApplication()
        let usbCableLabel = app.staticTexts["itemName_USB Cable"]
        let labelExists = usbCableLabel.waitForExistence(timeout: 5) // Wait up to 5 seconds
        XCTAssertTrue(labelExists, "USB Cable label should be visible")
    }
    
    func testAddItemButtonTapAndTitleChange() throws {
        let app = XCUIApplication()
        let addItemButton = app.buttons["addItemButton"]
        XCTAssertTrue(addItemButton.exists, "Add Item button should be visible")

        addItemButton.tap()

        // Wait for the new navigation bar to appear and check its title
        let addItemNavigationBar = app.navigationBars["AddItemView"]
        XCTAssertTrue(addItemNavigationBar.waitForExistence(timeout: 5), "AddItemView navigation bar should appear")
    }
    
    
}
