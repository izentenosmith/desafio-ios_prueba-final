//
//  ButtonView.swift
//  prueba-final
//
//  Created by Ignacio Zenteno on 21-12-24.
//

import SwiftUI

struct ButtonView: View {
    let title: String
    let systemImage: String
    
    var body: some View {
        HStack {
            Image(systemName: systemImage)
                .font(.title2)
            Text(title)
                .font(.title3)
                .fontWeight(.semibold)
        }
        .frame(width: 280, height: 60)
        .background(Color("marvel_red"))
        .foregroundColor(.white)
        .cornerRadius(15)
        .shadow(radius: 5)
    }
} 