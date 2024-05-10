//
//  ContentView.swift
//  UIPractice
//
//  Created by Nazmul Haque Nahin on 9/5/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            // background color
            Color(red: 0.09, green: 0.63, blue: 0.52)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/) 
            // eta title bar shoho green kore fele
            VStack{
                
                Image("nahin")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150.0,height: 150.0)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(Circle().stroke(Color.white,lineWidth: 5))
                
                // full name
                Text("Nazmul Haque Nahin")
                    .font(Font.custom("Pacifico-Regular", size: 35))
                    .bold()
                    .foregroundColor(.white)
                
                // job title
                Text("Software Engineer")
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                
                Divider()
                
                
                ContactInfo(text: "+88 0123456789", imageName: "phone.fill")
                ContactInfo(text: "nahin.cdr@gmail.com", imageName: "envelope2.fill")
                
                
                
                
                
            }
            
    
        }
    }
}




#Preview {
    ContentView()
}

struct ContactInfo: View {
    
    let text : String
    let imageName : String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .frame(height:50)
            .foregroundColor(.white)
            .overlay(
                // hstack is Row in flutter
                HStack{
                    Image(systemName: imageName).foregroundColor(.green)
                    Text(text).foregroundColor(.black)
                }
            )
        .padding(.all)
    }
}
