//
//  ItemTests.swift
//  InventoryServ
//
import XCTest
@testable import InventoryServ // Import main app module

final class ItemTests: XCTestCase {
    
    func testItemInitialization() throws {
        let newItem = Item(name: "Test Item", description: "Test Description", location: "Test Location", image: "test_image", category: "Test Category")
        
        XCTAssertEqual(newItem.name, "Test Item")
        XCTAssertEqual(newItem.description, "Test Description")
        XCTAssertEqual(newItem.location, "Test Location")
        XCTAssertEqual(newItem.image, "test_image")
        XCTAssertEqual(newItem.category, "Test Category")
    }
    
//    func testItemInitializationWithOptionalValuesNil() throws {
//        let newItem = Item(name: "Another Item", description: nil, location: "Another Location", image: nil, category: nil)
//
//        XCTAssertEqual(newItem.name, "Another Item")
//        XCTAssertNil(newItem.description)
//        XCTAssertEqual(newItem.location, "Another Location")
//        XCTAssertNil(newItem.image)
//        XCTAssertNil(newItem.category)
//    }    
    
}

