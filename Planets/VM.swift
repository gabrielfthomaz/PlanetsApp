//
//  VM.swift
//  Planets
//
//  Created by Gabriel Fernandes Thomaz on 20/09/24.
//



import Combine

import Foundation
//
//struct Composition: Decodable, Hashable {
//    let elements: [Element]
//    let atmosphere: String
//}
//
//struct Element: Decodable, Hashable {
//    let element: String
//    let percentage: String
//}


struct Astros: Decodable, Hashable {
    let eleVem: String
    let name: String
//    let description: String
    let image_url: String
//    let composition: Composition
//    let diameterKm: Int
//    let moons: Int
}

class ViewModel : ObservableObject {
    @Published var chars : [Astros] = []
    
    func fetch(){
        guard let url = URL(string: "http://10.87.155.78:1880/planetaa" ) else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
                guard let data = data, error == nil else{
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode([Astros].self, from: data)
                
                DispatchQueue.main.async {
                    self?.chars = parsed
                }
            }catch{
                print(error)
            }
        }
        
        task.resume()
    }
}



final class ContentViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published private(set) var stateModel: UIStateModel = UIStateModel()
    @Published private(set) var activeCard: Int = 0
    private var cancellables: [AnyCancellable] = []
    
    // MARK: - Lifecycle
    
    init() {
            self.stateModel.$activeCard.sink { completion in
                switch completion {
                case let .failure(error):
                    print("finished with error: ", error.localizedDescription)
                case .finished:
                    print("finished")
                }
            } receiveValue: { [weak self] activeCard in
                self?.someCoolMethodHere(for: activeCard)
            }.store(in: &cancellables)
        }
    
    // MARK: - Helpers
    
    private func someCoolMethodHere(for activeCard: Int) {
        print("someCoolMethodHere: index received: ", activeCard)
        self.activeCard = activeCard
    }
}
