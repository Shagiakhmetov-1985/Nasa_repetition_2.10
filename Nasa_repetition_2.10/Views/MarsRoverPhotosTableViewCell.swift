//
//  MarsRoverPhotosTableViewCell.swift
//  Nasa_repetition_2.10
//
//  Created by Marat Shagiakhmetov on 13.10.2022.
//

import UIKit

class MarsRoverPhotosTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageOfPhoto: UIImageView!
    @IBOutlet weak var labelOfId: UILabel!
    @IBOutlet weak var labelOfDateEarth: UILabel!
    
    func configure(with camera: Camera) {
        labelOfId.text = "ID: " + string(value: camera.id)
        labelOfDateEarth.text = "Date of Earth: " + camera.earth_date
        
        guard let url = URL(string: camera.img_src) else { return }
        
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url) else { return }
            
            DispatchQueue.main.async {
                self.imageOfPhoto.image = UIImage(data: imageData)
            }
        }
    }
    
    private func string(value: Int) -> String {
        return String(value)
    }
}
