//
//  Information.swift
//  Nasa_repetition_2.10
//
//  Created by Marat Shagiakhmetov on 11.10.2022.
//

struct Information: Decodable {
    let copyright: String?
    let date: String?
    let explanation: String?
    let title: String?
    let url: String?
}

struct Photos: Decodable {
    let photos: [Camera]
}

struct Camera: Decodable {
    let id: Int
    let img_src: String
    let earth_date: String
    let rover: Rover
}

struct Rover: Decodable {
    let landing_date: String
    let launch_date: String
    let status: String
}
