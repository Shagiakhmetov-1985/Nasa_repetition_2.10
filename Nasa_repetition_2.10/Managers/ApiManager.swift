//
//  ApiManager.swift
//  Nasa_repetition_2.10
//
//  Created by Marat Shagiakhmetov on 11.10.2022.
//

class ApiManager {
    static let shared = ApiManager()
    
    private let key = "EgoMAVMGvk0DONgde5vQc6PJXYlZDSuSQ9dKkYWJ"
    
    var nasaInformation: String {
        "https://api.nasa.gov/planetary/apod?api_key=\(key)"
    }
    
    private init() {}
}
