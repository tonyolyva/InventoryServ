//
//  Item.swift
//  InventoryServ
//
import Foundation

struct Item: Identifiable {
    let id = UUID() // Add this if it's missing
    let name: String
    let description: String?
    let location: String
    let image: String
    let category: String
}
