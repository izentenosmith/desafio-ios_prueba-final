import SwiftUI

struct ApiMarvelHeroView: View {
    @StateObject var viewModel: ApiMarvelHeroViewModel
    @State private var showingHeroDetail = false
    
    var body: some View {
        Group {
            if viewModel.isLoading {
                ProgressView()
                    .tint(.white)
            } else if let error = viewModel.error {
                Text(error)
                    .foregroundColor(.white)
            } else {
                List {
                    ForEach(viewModel.heroes) { hero in
                        ApiHeroRowView(hero: hero)
                            .onTapGesture {
                                viewModel.fetchHeroDetail(id: hero.id)
                                showingHeroDetail = true
                            }
                            .listRowBackground(Color("marvel_darkgrey"))
                            .listRowSeparator(.visible, edges: .bottom)
                            .listRowSeparatorTint(.white)
                    }
                }
                .scrollContentBackground(.hidden)
                .background(Color("marvel_blue"))
            }
        }
        .navigationTitle("Héroes Marvel")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(Color("marvel_red"), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .foregroundColor(.white)
        .sheet(isPresented: $showingHeroDetail) {
            if let hero = viewModel.selectedHero {
                ApiMarvelHeroDetailView(hero: hero)
            }
        }
        .onAppear {
            if viewModel.heroes.isEmpty {
                viewModel.fetchHeroes()
            }
        }
    }
}

struct ApiHeroRowView: View {
    let hero: ApiMarvelHero
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: hero.imagen)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
                    .tint(.white)
            }
            .frame(width: 50, height: 50)
            .cornerRadius(8)
            
            VStack(alignment: .leading) {
                Text(hero.nombre)
                    .font(.headline)
                    .foregroundColor(.white)
                Text(hero.primeraAparicion)
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.7))
            }
        }
        .padding(.vertical, 4)
    }
} 