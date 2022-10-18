//
//  EarthPhoto.swift
//  Nasa_repetition_2.10
//
//  Created by Marat Shagiakhmetov on 17.10.2022.
//

struct Earth: Decodable {
    let identifier: String?
    let caption: String?
    let image: String?
    let centroid_coordinates: CentroidCoordinates?
    let dscovr_j2000_position: DscovrPosition?
    let lunar_j2000_position: LunarPosition?
    let sun_j2000_position: SunPosition?
    let attitude_quaternions: AttitudeQuaternions?
    let date: String?
}

struct CentroidCoordinates: Decodable {
    let lat: Double?
    let lon: Double?
}

struct DscovrPosition: Decodable {
    let x: Double?
    let y: Double?
    let z: Double?
}

struct LunarPosition: Decodable {
    let x: Double?
    let y: Double?
    let z: Double?
}

struct SunPosition: Decodable {
    let x: Double?
    let y: Double?
    let z: Double?
}

struct AttitudeQuaternions: Decodable {
    let q0: Double?
    let q1: Double?
    let q2: Double?
    let q3: Double?
}

enum Image: String, CaseIterable {
    case globalAmerican = "globe.americas"
    case globalAmericanFill = "globe.americas.fill"
    case globalEuropeAfrica = "globe.europe.africa"
    case globalEuropeAfricaFill = "globe.europe.africa.fill"
    case globalAsiaAustralia = "globe.asia.australia"
    case globalAsiaAustraliaFill = "globe.asia.australia.fill"
}
