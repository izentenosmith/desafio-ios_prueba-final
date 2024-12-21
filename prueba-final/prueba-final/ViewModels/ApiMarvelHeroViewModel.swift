import Foundation

class ApiMarvelHeroViewModel: ObservableObject {
    @Published var heroes: [ApiMarvelHero] = []
    @Published var selectedHero: ApiMarvelHeroDetail?
    @Published var isLoading = false
    @Published var error: String?
    
    private let baseURL = "https://heroes-api-two.vercel.app/es/marvel/heroes"
    
    func fetchHeroes() {
        isLoading = true
        
        guard let url = URL(string: baseURL) else {
            error = "URL inválida"
            isLoading = false
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            DispatchQueue.main.async {
                self?.isLoading = false
                
                if let error = error {
                    self?.error = error.localizedDescription
                    return
                }
                
                guard let data = data else {
                    self?.error = "No se recibieron datos"
                    return
                }
                
                do {
                    let heroes = try JSONDecoder().decode([ApiMarvelHero].self, from: data)
                    self?.heroes = heroes
                } catch {
                    self?.error = "Error al decodificar: \(error.localizedDescription)"
                }
            }
        }.resume()
    }
    
    func fetchHeroDetail(id: Int) {
        isLoading = true
        selectedHero = nil // Reset previous selection
        
        guard let url = URL(string: "\(baseURL)/\(id)") else {
            error = "URL inválida"
            isLoading = false
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            DispatchQueue.main.async {
                self?.isLoading = false
                
                if let error = error {
                    self?.error = error.localizedDescription
                    return
                }
                
                guard let data = data else {
                    self?.error = "No se recibieron datos"
                    return
                }
                
                do {
                    let heroDetail = try JSONDecoder().decode(ApiMarvelHeroDetail.self, from: data)
                    self?.selectedHero = heroDetail
                } catch {
                    self?.error = "Error al decodificar: \(error.localizedDescription)"
                }
            }
        }.resume()
    }
} 