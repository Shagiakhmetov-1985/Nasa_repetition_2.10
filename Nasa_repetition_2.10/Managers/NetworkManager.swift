//
//  NetworkManager.swift
//  Nasa_repetition_2.10
//
//  Created by Marat Shagiakhmetov on 11.10.2022.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    func fetchData(from url: String, with complition: @escaping (Information) -> Void) {
        guard let getURL = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: getURL) { data, _, error in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let information = try JSONDecoder().decode(Information.self, from: data)
                complition(information)
            } catch let error {
                print("Ошибка получения данных", error)
            }
        }.resume()
    }
}
