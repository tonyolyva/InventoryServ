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
    
    var body: some View {
        NavigationView {
            List(items) { item in
                VStack(alignment: .leading) {
                    Text(item.name).font(.headline)
                    Text(item.location).font(.subheadline)
                    if let description = item.description{
                        Text(description).font(.caption)
                    }
                }
            }
            .navigationTitle("Inventory")
        }
    }
}

#Preview {
    ContentView()
}
