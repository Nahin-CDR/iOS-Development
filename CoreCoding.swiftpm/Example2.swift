//
//  Example2.swift
//  CoreCoding
//
//  Created by Nazmul Haque Nahin on 3/7/24.
//

import SwiftUI

struct ContentView2: View {
    @State private var resultText: String = "Press the button to start tasks"
    
    var body: some View {
        VStack {
            Text(resultText)
                .padding()
            
            Button(action: {
                startConcurrentTasks()
            }) {
                Text("Start Tasks")
            }
            .padding()
        }
    }
    
    func startConcurrentTasks() {
        let group = DispatchGroup()
        
        group.enter()
        DispatchQueue.global(qos: .userInitiated).async {
            let task1Result = performTask1()
            DispatchQueue.main.async {
                self.resultText = task1Result
                group.leave()
            }
        }
        
        group.enter()
        DispatchQueue.global(qos: .userInitiated).async {
            let task2Result = performTask2()
            DispatchQueue.main.async {
                self.resultText += "\n\(task2Result)"
                group.leave()
            }
        }
        
        group.notify(queue: .main) {
            self.resultText += "\nBoth tasks completed!"
        }
    }
    
    func performTask1() -> String {
        sleep(2)
        return "Task 1 completed!"
    }
    
    func performTask2() -> String {
        sleep(10)
        return "Task 2 completed!"
    }
}

struct ContentView_Previews9: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
