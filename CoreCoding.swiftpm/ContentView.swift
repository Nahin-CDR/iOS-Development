import SwiftUI


class CustomThread {
    func createThread() {
        let thread: Thread = Thread(target:self,selector: #selector(threadSelector),object: nil)
        
        
        
        thread.start()
    }
    
    @objc func threadSelector(){
        print("Custom thread in action")
    }
    
}


class QueueExample{
    func example(){
        var counter = 1
        DispatchQueue.main.async {
            for i in 0...3 {
                counter = i
                print("counter 1 : \(counter)")
            }
        }
        
        
        for i in 4...6 {
            counter = i
            print("counter 2 : \(counter)")
        }
        
        
        
        DispatchQueue.main.async {
            counter = 9
            print("Last Counter : \(counter)")
        }
        
        
        
        
        
        
        
        
        
    }
}







struct ContentView: View {
    let customThread = CustomThread()
    let ex = QueueExample()
    
    let d = DispatchQExmple()
    
    var body: some View {
        VStack {
            Button("Button"){
                d.ex1()
                //ex.example()
                //customThread.createThread()
            }
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            .padding(20)
            .background(.gray)
        }
    }
}



class DispatchQExmple {
    
    
    
    func ex1(){
        DispatchQueue.main.async {
            // This task will be executed on the main thread
            print("This runs on the main queue.")
        }
        
        
        DispatchQueue.global().async {
            // This task will be executed on a background thread
            print("This runs on a global queue.")
        }
        
        
        
        
        let concurrentQueue = DispatchQueue(label: "com.example.concurrentQueue", attributes: .concurrent)

        concurrentQueue.async {
            print("Task A started.")
            sleep(2)
            print("Task A finished.")
        }

        concurrentQueue.async {
            print("Task B started.")
            sleep(1)
            print("Task B finished.")
        }
        
        
        
        
    }
    
    
    
    
}
