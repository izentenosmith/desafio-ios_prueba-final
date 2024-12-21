//
//  ContentView.swift
//  prueba-final
//
//  Created by Ignacio Zenteno on 21-12-24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background Image
                Image("marvel_bg")
                    .resizable()
                    .scaledToFill()
                    .offset(y: 100)
                    .ignoresSafeArea()
                
                // Contenido
                VStack {
                    Spacer()
                    
                    // Botones de navegación
                    VStack(spacing: 20) {
                        NavigationLink(destination: ApiMarvelHeroView(viewModel: ApiMarvelHeroViewModel())) {
                            ButtonView(title: "Héroes Marvel", 
                                     systemImage: "globe")
                        }
                        
                        NavigationLink(destination: CustomHeroView(modelContext: modelContext)) {
                            ButtonView(title: "Mis Héroes", 
                                     systemImage: "person.fill")
                        }
                    }
                    .padding(.bottom, 50)
                }
            }
            .navigationTitle("Biblioteca de Héroes")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color("marvel_red"), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
    }
} 