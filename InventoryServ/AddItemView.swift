//
//  AddItemView.swift
//  InventoryServ
//

import SwiftUI

struct AddItemView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Text("Add New Item")
                .navigationTitle("Add Item")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Cancel") {
                            dismiss()
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Save") {
                            // Save the new item
                            dismiss()
                        }
                    }
                }
        }
    }
}

#Preview {
    AddItemView()
}
