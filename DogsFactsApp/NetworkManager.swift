//
//  NetworkManager.swift
//  DogsFactsApp
//
//  Created by Kaukab Farrukh on 2024-11-25.
//

import Foundation

class NetworkManager: ObservableObject {
    @Published var dogFact: String = ""
    
    private let urlString = "https://dog-api.kinduff.com/api/facts"
    
    func fetchDogFact() {
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching dog fact: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(DogFactResponse.self,  from: data)
                DispatchQueue.main.async {
                    self.dogFact = decodedData.facts.first ?? "No fact available"
                }
            } catch {
                print("Error decoding data: \(error.localizedDescription)")
            }
        }
        
        task.resume()
    }
    
}

struct DogFactResponse: Codable {
    let facts: [String]
}
