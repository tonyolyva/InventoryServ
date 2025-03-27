//
//  ItemUITest.swift
//  InventoryServ
//

import XCTest

@MainActor
final class ItemUITest: XCTestCase {
    
    let app = XCUIApplication() // Initialize XCUIApplication once for the test suite
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // Launch the application before each test
        Task { @MainActor in
            let app = XCUIApplication() // Initialize XCUIApplication here
            app.launch()
        }
    }
    
    func testAppLaunchesSuccessfully() throws {
        XCTAssertTrue(app.state == .runningForeground, "App should be running in the foreground")
    }
    
    func testInventoryLabelIsVisibleOnInventoryScreen() throws {
        let inventoryLabel = app.staticTexts["Inventory"]
        XCTAssertTrue(inventoryLabel.waitForExistence(timeout: 5), "Inventory label should be visible within 5 seconds")
    }
    
    func testAddItemButtonTapNavigatesToAddItemView() throws {
        let addItemButton = app.buttons["addItemButton"]
        XCTAssertTrue(addItemButton.waitForExistence(timeout: 5), "Add Item button should be visible within 5 seconds")
        addItemButton.tap()
        
        let addItemNavigationBar = app.navigationBars.firstMatch
        XCTAssertTrue(addItemNavigationBar.waitForExistence(timeout: 5), "AddItemView navigation bar should appear within 5 seconds")
        
        let addItemTitle = addItemNavigationBar.staticTexts["Add Item"]
        XCTAssertTrue(addItemTitle.waitForExistence(timeout: 5), "AddItemView navigation bar should have the title 'Add Item' within 5 seconds")
    }
    
    func testItemLabelExistsOnInventoryList() throws {
        let expectedItemName = "USB Cable"
        let itemLabelIdentifier = "itemName_\(expectedItemName)"
        let usbCableLabel = app.staticTexts[itemLabelIdentifier]
        XCTAssertTrue(usbCableLabel.waitForExistence(timeout: 5), "\(expectedItemName) label should be visible within 5 seconds")
        XCTAssertEqual(usbCableLabel.label, expectedItemName, "Label text should be '\(expectedItemName)'")
    }
    
    func testAddItemButtonTapNavigatesToAddItemViewWithTitle() throws {
        let addItemButton = app.buttons["addItemButton"]
        XCTAssertTrue(addItemButton.waitForExistence(timeout: 5), "Add Item button should be visible within 5 seconds")
        addItemButton.tap()
        
        let addItemNavigationBar = app.navigationBars.firstMatch
        XCTAssertTrue(addItemNavigationBar.waitForExistence(timeout: 5), "AddItemView navigation bar should appear within 5 seconds")
        
        let addItemTitle = addItemNavigationBar.staticTexts["Add Item"]
        XCTAssertTrue(addItemTitle.waitForExistence(timeout: 5), "AddItemView navigation bar should have the title 'Add Item' within 5 seconds")
    }
    
}
