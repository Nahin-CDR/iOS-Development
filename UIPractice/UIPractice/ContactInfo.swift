//
//  ContactInfo.swift
//  UIPractice
//
//  Created by Nazmul Haque Nahin on 11/5/24.
//

import SwiftUI

struct ContactInfo: View {
    let text: String
    let imageName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .frame(height: 50)
            .foregroundColor(.white)
            .overlay(
                HStack {
                    Image(systemName: imageName)
                        .foregroundColor(.green)
                    Text(text)
                        .foregroundColor(.black)
                }
            )
            .padding(.all)
    }
}


