//
//  MarsRoverPhotos.swift
//  Nasa_repetition_2.10
//
//  Created by Marat Shagiakhmetov on 19.10.2022.
//

struct Mars: Decodable {
    let photos: [Camera]
}

struct Camera: Decodable {
    let id: Int?
    let img_src: String?
    let earth_date: String?
    let rover: Rover
}

struct Rover: Decodable {
    let landing_date: String?
    let launch_date: String?
    let status: String?
}
