//
//  Example1.swift
//  CoreCoding
//
//  Created by Nazmul Haque Nahin on 2/7/24.
//

import SwiftUI

struct ContentView2 : View {
    
    @State private var counter = 1
    
    @State private var resultText : String = "Press the button to start the task"
    
    func startBackGroundTask(){
        DispatchQueue.global(qos: .background).async {
            // simulate a back ground task
            let result = performLongRunningTask()
            
            DispatchQueue.main.async {
                self.counter = result
            }
        }
    }
    
    
    func performLongRunningTask() -> Int {
        // simulating a long running task (it can be a network call )
        
        sleep(2)
        return counter+1
    }
    
    
    
    
    
    
    
    var body: some View {
        VStack{
            Text("Counter : \(counter)")
                .padding()
            
            Button(action:{
                // function to call
               startBackGroundTask()
            }){
                // button text
                Text("Start Task")
            }
        }
    }
}



struct ContentView_Previews : PreviewProvider{
    static var previews: some View{
        ContentView2()
    }
}
