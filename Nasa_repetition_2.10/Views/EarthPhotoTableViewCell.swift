//
//  MarsRoverPhotosTableViewCell.swift
//  Nasa_repetition_2.10
//
//  Created by Marat Shagiakhmetov on 13.10.2022.
//

import UIKit

class EarthPhotoTableViewCell: UITableViewCell {
    @IBOutlet weak var imageOfPhoto: UIImageView!
    @IBOutlet weak var labelOfIdentifier: UILabel!
    
    let image = Image.allCases.shuffled()
    
    func configure(with dataOfEarth: Earth) {
        labelOfIdentifier.font = UIFont.systemFont(ofSize: 25)
        labelOfIdentifier.text = "ID: " + (dataOfEarth.identifier ?? "0")
        imageOfPhoto.image = UIImage(systemName: image.first?.rawValue ?? "")
    }
}
