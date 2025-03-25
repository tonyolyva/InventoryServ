//
//  Item.swift
//  InventoryServ
//
import Foundation

struct Item: Identifiable {
    let id = UUID()
    var name: String
    var description: String? // description is optional
    var location: String // e.g., "Row 3, Box 12"
    var image: String? // Optional image name, if you want to add images
    var category: String? //Optional category
}
