import SwiftUI

struct ApiMarvelHeroDetailView: View {
    let hero: ApiMarvelHeroDetail
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    AsyncImage(url: URL(string: hero.imagen)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                            .tint(.white)
                    }
                    .frame(maxWidth: .infinity)
                    .cornerRadius(15)
                    .shadow(radius: 5)
                    
                    VStack(alignment: .leading, spacing: 15) {
                        InfoSection(title: "Información Personal") {
                            InfoRow(title: "Nombre real", value: hero.nombreReal)
                        }
                        
                        InfoSection(title: "Alias") {
                            ForEach(hero.alias, id: \.self) { alias in
                                Text("• \(alias)")
                                    .foregroundColor(.white)
                            }
                        }
                        
                        InfoSection(title: "Poderes") {
                            ForEach(hero.poderes, id: \.self) { poder in
                                Text("• \(poder)")
                                    .foregroundColor(.white)
                            }
                        }
                        
                        InfoSection(title: "Historia") {
                            Text(hero.historia)
                                .foregroundColor(.white)
                        }
                        
                        InfoSection(title: "Afiliaciones") {
                            ForEach(hero.afiliaciones, id: \.self) { afiliacion in
                                Text("• \(afiliacion)")
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .background(Color("marvel_darkgrey"))
            .navigationTitle(hero.nombre)
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