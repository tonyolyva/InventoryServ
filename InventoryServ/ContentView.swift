//
//  ContentView.swift
//  InventoryServ
//

import SwiftUI

struct ContentView: View {
    var items: [Item] = [
        Item(name: "USB Cable", description: "Long USB-C cable", location: "Row 1, Box 5", image: "usb_cable", category: "Electronics"),
        Item(name: "Adapter", description: "USB-C to HDMI adapter", location: "Row 2, Box 8", image: "adapter", category: "Electronics"),
        Item(name: "Hammer", description: "Heavy hammer", location: "Row 3, Box 1", image: "hammer", category: "Tools"),
        // Add more items...
    ]
    
    @State private var isAddingItem = false // Declare isAddingItem as state
    
    var body: some View {
        //        NavigationView {
        NavigationStack { // This MUST be the first view
            List(items) { item in
                VStack(alignment: .leading) {
                    Text(item.name)
                        .font(.headline)
                        .accessibilityIdentifier("itemName_\(item.name)")
                    Text(item.location)
                        .font(.subheadline)
                        .accessibilityIdentifier("itemLocation_\(item.name)")
                    if let description = item.description {
                        Text(description)
                            .font(.caption)
                            .accessibilityIdentifier("itemDescription_\(item.name)")
                    }
                }
            }
            .navigationTitle("Inventory")
            .accessibilityIdentifier("inventoryList")
            .navigationDestination(isPresented: $isAddingItem) {
                AddItemView() // This should be your 3rd page
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { isAddingItem = true }) {
                        Label("Add Item", systemImage: "folder.badge.plus")
                    }
                    .accessibilityIdentifier("addItemButton")
                }
            }
        }
    }
    
    func addItem() {
        isAddingItem = true
        print("isAddingItem set to: \(isAddingItem)")
    }
}
