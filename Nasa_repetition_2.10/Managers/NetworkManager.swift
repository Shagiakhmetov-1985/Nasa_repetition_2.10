//
//  NetworkManager.swift
//  Nasa_repetition_2.10
//
//  Created by Marat Shagiakhmetov on 11.10.2022.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    func fetchDataInformation(from url: String, with complition: @escaping (Information) -> Void) {
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
    
    func fetchDataMarsPhotos(from url: String, with complition: @escaping ([Camera]) -> Void) {
        guard let getURL = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: getURL) { data, _, error in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let marsPhotos = try JSONDecoder().decode([Camera].self, from: data)
                complition(marsPhotos)
            } catch let error {
                print("error of data", error)
            }
        }.resume()
    }
}
