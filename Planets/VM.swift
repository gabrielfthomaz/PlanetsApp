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
    let description: String
    let image_url: String
    let composition: Composition
    let diameter_km: Int
    let moons: Int
 
}

struct Composition: Decodable, Hashable{
    
    let elements: [AllElements]
    let atmosphere: String
}

struct AllElements: Decodable, Hashable{
    
    let element: String
    let percentage: String
    
}

class ViewModel : ObservableObject {
    @Published var chars : [Astros] = []
    
    func fetch(){
        guard let url = URL(string: "http://127.0.0.1:1880/planetaa" ) else{
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



enum APIKey {
    
    static var `default` : String {
        guard let filePath = Bundle.main.path(forResource: "Info", ofType: "plist")
        else {
            fatalError("Arquivo não encontrado")
        }
        let plist = NSDictionary(contentsOfFile: filePath)
        guard let value = plist?.object(forKey: "API_KEY") as? String else {
            fatalError("API key não encontrada no arquivo")
        }
        if value.starts(with: "_"){
            fatalError("Necessita-se de uma API key")
            
        }
        return value
    }
    
}
