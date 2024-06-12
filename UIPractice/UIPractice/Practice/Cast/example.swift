//
//  example.swift
//  UIPractice
//
//  Created by Nazmul Haque Nahin on 11/6/24.
//

import SwiftUI

struct ContentView3: View {
    var body: some View {
        VStack {
            Text("AirPlay Video")
                .font(.largeTitle)
                .padding()
            
            VideoPlayerView(
                videoURL: URL(
                    string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/big_buck_bunny_1080p.mp4")!)
                .frame(height: 300)
                .cornerRadius(10)
                .padding()
        }
    }
}
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

#Preview {
     ContentView3()
    //example()
}
