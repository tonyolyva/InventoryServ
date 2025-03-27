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
    
    func testItemEquality() throws {
        let item1 = Item(name: "Test Item", description: "Desc", location: "Loc", image: "img", category: "Cat")
        let item2 = Item(name: "Test Item", description: "Desc", location: "Loc", image: "img", category: "Cat")
        let item3 = Item(name: "Different Item", description: "Desc", location: "Loc", image: "img", category: "Cat")
        
        XCTAssertEqual(item1, item2, "Two items with the same properties should be equal")
        XCTAssertNotEqual(item1, item3, "Two items with different names should not be equal")
    }
    
    func testItemHashing() throws {
        let item1 = Item(name: "Test Item", description: "Desc", location: "Loc", image: "img", category: "Cat")
        let item2 = Item(name: "Test Item", description: "Desc", location: "Loc", image: "img", category: "Cat")
        
        XCTAssertEqual(item1.hashValue, item2.hashValue, "Equal items should have the same hash value")
    }
    
    // In your ItemTests.swift
    func testFormattedLocation() throws {
        let item = Item(name: "Test Item", description: "Desc", location: "Row 1, Box 5", image: "img", category: "Cat")
        XCTAssertEqual(item.formattedLocation(), "Located at: Row 1, Box 5")
    }
    
    func testItemDecoding() throws {
        let jsonString = """
        {
            "name": "JSON Item",
            "description": "JSON Desc",
            "location": "JSON Loc",
            "image": "json_img",
            "category": "JSON Cat"
        }
        """
        let jsonData = Data(jsonString.utf8)
        let decoder = JSONDecoder()
        
        do {
            let decodedItem = try decoder.decode(Item.self, from: jsonData)
            XCTAssertEqual(decodedItem.name, "JSON Item")
            XCTAssertEqual(decodedItem.description, "JSON Desc")
            XCTAssertEqual(decodedItem.location, "JSON Loc")
            XCTAssertEqual(decodedItem.image, "json_img")
            XCTAssertEqual(decodedItem.category, "JSON Cat")
        } catch {
            XCTFail("Failed to decode Item from JSON: \(error)")
        }
    }
    
    func testItemEncoding() throws {
        let item = Item(name: "Encode Item", description: "Encode Desc", location: "Encode Loc", image: "encode_img", category: "Encode Cat")
        let encoder = JSONEncoder()
        let decoder = JSONDecoder()
        
        do {
            let encodedData = try encoder.encode(item)
            // let encodedString = String(data: encodedData, encoding: .utf8)! // Removed unused variable
            let decodedItem = try decoder.decode(Item.self, from: encodedData)
            
            XCTAssertEqual(decodedItem.name, item.name)
            XCTAssertEqual(decodedItem.description, item.description)
            XCTAssertEqual(decodedItem.location, item.location)
            XCTAssertEqual(decodedItem.image, item.image)
            XCTAssertEqual(decodedItem.category, item.category)
            
        } catch {
            XCTFail("Failed to encode and decode Item: \(error)")
        }
    }
    
}
