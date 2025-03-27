//
//  Item.swift
//  InventoryServ
//

import Foundation

struct Item: Identifiable, Equatable, Hashable, Decodable, Encodable {
    let id = UUID()
    let name: String
    let description: String?
    let location: String
    let image: String
    let category: String
    
    static func == (lhs: Item, rhs: Item) -> Bool {
        return lhs.name == rhs.name &&
        lhs.description == rhs.description &&
        lhs.location == rhs.location &&
        lhs.image == rhs.image &&
        lhs.category == rhs.category
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(description)
        hasher.combine(location)
        hasher.combine(image)
        hasher.combine(category)
    }
}

extension Item { // Moved the extension here
    func formattedLocation() -> String {
        return "Located at: \(location)"
    }
}
