//
//  UserView.swift
//  HelloApp
//
//  Created by Nazmul Haque Nahin on 16/9/24.
//

import SwiftUI

struct UserView: View {
    var user: User
    
    var body: some View {
        VStack(alignment: .leading, spacing:  10 ,content: {
            // name
            Text(user.name)
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            
            // user name portion
            HStack{
                Image(systemName: "person.circle.fill")
                    .foregroundColor(.gray)
                Text(user.username)
                    .font(.headline)
            }
            
            // user email section
            HStack{
                Image(systemName: "envelope.fill")
                    .foregroundColor(.gray)
                Text(user.email)
                    .font(.subheadline)
            }
            
            // website link portion
            HStack{
                Image(systemName: "link")
                    .foregroundColor(.gray)
                Text(user.website)
                    .font(.subheadline)
            }
            
            
            
            VStack(alignment: .leading, content: {
                
                Text("Company: \(user.company.name)")
                    .font(.headline)
                
                Text("Catchphrase: \(user.company.catchPhrase)")
                
            })
            
            Divider()
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.blue).shadow(radius: 3))
                .padding(.horizontal)
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
        })
    }
}
