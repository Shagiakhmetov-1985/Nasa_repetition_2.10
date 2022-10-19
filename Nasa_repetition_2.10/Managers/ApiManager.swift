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
    
    var earthPhoto: String {
        "https://api.nasa.gov/EPIC/archive/natural/2019/05/30/png/epic_1b_20190530011359.png?api_key=\(key)"
    }
    
    var earthDetails: String {
        "https://api.nasa.gov/EPIC/api/natural?api_key=\(key)"
    }
    
    var marsRoverPhotos: String {
        "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&page=2&api_key=\(key)"
    }
    
    private init() {}
}
