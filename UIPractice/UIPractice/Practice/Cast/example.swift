//
//  example.swift
//  UIPractice
///
//  Created by Nazmul Haque Nahin on 30/6/24.
///

/*https://be-music.s3.us-west-1.amazonaws.com/ffceadba-eb7b-4392-8d66-f40f75d61b54/04251e11-0ecd-11ee-8bcc-179c0fb7189f.mp4
 */



/*
 http://commondatastorage.googleapis.com/gtv-videos-bucket/big_buck_bunny_1080p.mp4
 */
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
