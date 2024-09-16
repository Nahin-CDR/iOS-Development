//
//  Example3.swift
//  CoreCoding
//
//  Created by Nazmul Haque Nahin on 3/7/24.
//


import SwiftUI

struct ContentView3: View {
    @State private var resultText: String = "Press  "
    
    var body: some View {
        VStack {
            Text(resultText)
                .padding()
            
            Button(action: {
                startQoSTasks()
            }) {
                Text("Start Tasks")
            }
            .padding()
        }
    }
    
    func startQoSTasks() {
        
        //let group = DispatchGroup()
        
        //group.enter()
        
        DispatchQueue.global(qos: .background).async {
            let backgroundTaskResult = performBackgroundTask()
            DispatchQueue.main.async {
                self.resultText = backgroundTaskResult
                //group.leave()
            }
        }
        
        //group.enter()
        
        DispatchQueue.global(qos: .userInteractive).async {
            let interactiveTaskResult = performInteractiveTask()
            DispatchQueue.main.async {
                self.resultText += "\n\(interactiveTaskResult)"
                //group.leave()
            }
        }
        
        //group.notify(queue: .main) {
        //    self.resultText += "\nBoth tasks completed!"
        //}
        
        
    }
    
    func performBackgroundTask() -> String {
        // Simulate a background task
        //sleep(3)
        return "Background task completed!"
    }
    
    func performInteractiveTask() -> String {
        // Simulate an interactive task
        //sleep(1)
        return "Interactive task completed!"
    }
}

//struct ContentView_Previews4: PreviewProvider {
//    static var previews: some View {
//        ContentView4()
//    }
//}
