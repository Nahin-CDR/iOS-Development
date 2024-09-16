//
//  Example4.swift
//  CoreCoding
//
//  Created by Nazmul Haque Nahin on 4/7/24.
//

import SwiftUI


class Counter {
    private var count = 0
    private let queue = DispatchQueue(label: "com.example.counterQueue")
    
    func increment() {
        queue.sync {
            count += 1
            
        }
    }
    
    func getCount() -> Int {
        return queue.sync {
            return count
        }
    }
}

struct ContentView4: View {
    @State private var resultText: String = "Press the button to increment counter"
    private let counter = Counter()
    
    var body: some View {
        VStack {
            Text(resultText)
                .padding()
            
            Button(action: {
                
                incrementCounter()
            }) {
                Text("Increment Counter")
            }
            .padding()
        }
    }
    
    func incrementCounter() {
        DispatchQueue.global(qos: .userInitiated).async {
            for _ in 0..<1000 {
                sleep(1)
                self.counter.increment()
                
            }
            DispatchQueue.main.async {
                self.resultText = "Counter: \(self.counter.getCount())"
            }
        }
    }
}

struct ContentView_Previews4: PreviewProvider {
    static var previews: some View {
        ContentView4()
    }
}
