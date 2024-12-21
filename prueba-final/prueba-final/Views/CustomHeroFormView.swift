import SwiftUI

struct CustomHeroFormView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: CustomHeroViewModel
    
    let heroToEdit: CustomHero?
    
    @State private var heroName: String = ""
    @State private var realName: String = ""
    @State private var powers: String = ""
    
    init(viewModel: CustomHeroViewModel, heroToEdit: CustomHero? = nil) {
        self.viewModel = viewModel
        self.heroToEdit = heroToEdit
        
        if let hero = heroToEdit {
            _heroName = State(initialValue: hero.heroName)
            _realName = State(initialValue: hero.realName)
            _powers = State(initialValue: hero.powers)
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Nombre del Héroe", text: $heroName)
                        .foregroundColor(.black)
                        .accentColor(.black)
                    TextField("Nombre Real", text: $realName)
                        .foregroundColor(.black)
                        .accentColor(.black)
                    TextField("Poderes", text: $powers)
                        .foregroundColor(.black)
                        .accentColor(.black)
                } header: {
                    Text("Información del Héroe")
                        .font(.title3)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                }
            }
            .scrollContentBackground(.hidden)
            .background(Color("marvel_darkgrey"))
            .navigationTitle(heroToEdit != nil ? "Editar Héroe" : "Nuevo Héroe")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color("marvel_red"), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancelar") {
                        dismiss()
                    }
                    .foregroundColor(.white)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(heroToEdit != nil ? "Guardar" : "Crear") {
                        if let hero = heroToEdit {
                            viewModel.updateHero(hero, 
                                              heroName: heroName, 
                                              realName: realName, 
                                              powers: powers)
                        } else {
                            viewModel.addHero(heroName: heroName, 
                                            realName: realName, 
                                            powers: powers)
                        }
                        dismiss()
                    }
                    .disabled(heroName.isEmpty || realName.isEmpty || powers.isEmpty)
                    .foregroundColor(heroName.isEmpty || realName.isEmpty || powers.isEmpty ? .gray : .white)
                }
            }
        }
    }
} 