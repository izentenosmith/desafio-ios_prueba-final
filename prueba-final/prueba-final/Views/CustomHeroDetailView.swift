import SwiftUI

struct CustomHeroDetailView: View {
    let hero: CustomHero
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    VStack(alignment: .leading, spacing: 15) {
                        InfoSection(title: "Información Personal") {
                            InfoRow(title: "Nombre del Héroe", value: hero.heroName)
                            InfoRow(title: "Nombre Real", value: hero.realName)
                        }
                        
                        InfoSection(title: "Poderes") {
                            Text(hero.powers)
                                .foregroundColor(.white)
                        }
                        
                        InfoSection(title: "Metadata") {
                            InfoRow(title: "Fecha de Creación", 
                                  value: hero.createdDate.formatted(date: .long, time: .standard))
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .background(Color("marvel_darkgrey"))
            .navigationTitle("Detalles del Héroe")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color("marvel_red"), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
} 