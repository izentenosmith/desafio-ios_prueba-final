import SwiftUI
import SwiftData

struct CustomHeroView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var heroes: [CustomHero]
    @StateObject private var viewModel: CustomHeroViewModel
    @State private var showingAddSheet = false
    @State private var showingDetailSheet = false
    @State private var showingEditSheet = false
    @State private var selectedHero: CustomHero?
    
    init(modelContext: ModelContext) {
        _viewModel = StateObject(wrappedValue: CustomHeroViewModel(modelContext: modelContext))
    }
    
    var body: some View {
        Group {
            if heroes.isEmpty {
                ContentUnavailableView(
                    "No hay héroes guardados",
                    systemImage: "person.fill.questionmark",
                    description: Text("Toca el botón + para agregar un héroe")
                )
                .foregroundColor(Color("marvel_blue"))
            } else {
                ScrollView {
                    LazyVStack(spacing: 10) {
                        ForEach(heroes) { hero in
                            CustomHeroRow(hero: hero) {
                                selectedHero = hero
                                showingDetailSheet = true
                            } onEdit: {
                                selectedHero = hero
                                showingEditSheet = true
                            } onDelete: {
                                viewModel.deleteHero(hero)
                            }
                            .background(Color("marvel_darkgrey"))
                            .cornerRadius(10)
                            .padding(.horizontal, 16)
                        }
                    }
                    .padding(.vertical, 10)
                }
                .background(Color("marvel_blue"))
            }
        }
        .navigationTitle("Mis Héroes")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(Color("marvel_red"), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .toolbar {
            Button {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                    showingAddSheet = true
                }
            } label: {
                Image(systemName: "plus")
                    .foregroundColor(.white)
            }
        }
        .sheet(isPresented: $showingAddSheet) {
            CustomHeroFormView(viewModel: viewModel)
        }
        .sheet(isPresented: $showingDetailSheet, onDismiss: { selectedHero = nil }) {
            if let hero = selectedHero {
                CustomHeroDetailView(hero: hero)
            }
        }
        .sheet(isPresented: $showingEditSheet, onDismiss: { selectedHero = nil }) {
            if let hero = selectedHero {
                CustomHeroFormView(viewModel: viewModel, heroToEdit: hero)
            }
        }
    }
}