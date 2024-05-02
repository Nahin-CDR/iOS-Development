//
//  ContentView.swift
//  HelloApp
//
//  Created by Nazmul Haque Nahin on 2/5/24.
//

import SwiftUI

struct ContentView: View {
    // State variable to store the text of the new to-do item
    @State private var newItemText = ""
    
    // Array to store the list of to-do items
    @State private var todoItems: [String] = []
    
    var body: some View {
        VStack {
            // Text field to input new to-do items
            TextField("Enter a new to-do item", text: $newItemText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            // Button to add new to-do item
            Button(action: {
                // Append the new item text to the array
                todoItems.append(newItemText)
                
                // Clear the text field
                newItemText = ""
            }) {
                Text("Add Item")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding()
            
            // List to display all to-do items
            List {
                ForEach(todoItems, id: \.self) { item in
                    Text(item)
                }
            }
            
            // Spacer to push the content to the top
            Spacer()
        }
        .padding()
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

