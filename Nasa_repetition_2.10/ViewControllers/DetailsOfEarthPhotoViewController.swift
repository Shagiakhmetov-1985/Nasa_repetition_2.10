//
//  PhotoOfRoverViewController.swift
//  Nasa_repetition_2.10
//
//  Created by Marat Shagiakhmetov on 13.10.2022.
//

import UIKit

class DetailsOfEarthPhotoViewController: UIViewController {
    
    @IBOutlet weak var imageOfPhoto: UIImageView!
    @IBOutlet weak var labelOfDescriptions: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var data: Earth!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        
        labelOfDescriptions.font = UIFont.systemFont(ofSize: 22)
        labelOfDescriptions.text = """
        Identifier: \(data.identifier ?? "")
        
        Caption: \(data.caption ?? "")
        
        Image: \(data.image ?? "")
        
        Centroid coordinates:
        lat = \(string(from: data.centroid_coordinates?.lat ?? 0))
        lon = \(string(from: data.centroid_coordinates?.lon ?? 0))
        
        Dscovr position:
        x = \(string(from: data.dscovr_j2000_position?.x ?? 0))
        y = \(string(from: data.dscovr_j2000_position?.y ?? 0))
        z = \(string(from: data.dscovr_j2000_position?.z ?? 0))
        
        Lunar position:
        x = \(string(from: data.lunar_j2000_position?.x ?? 0))
        y = \(string(from: data.lunar_j2000_position?.y ?? 0))
        z = \(string(from: data.lunar_j2000_position?.z ?? 0))
        
        Sun position:
        x = \(string(from: data.sun_j2000_position?.x ?? 0))
        y = \(string(from: data.sun_j2000_position?.y ?? 0))
        z = \(string(from: data.sun_j2000_position?.z ?? 0))
        
        Attitude quaternions:
        q0 = \(string(from: data.attitude_quaternions?.q0 ?? 0))
        q1 = \(string(from: data.attitude_quaternions?.q1 ?? 0))
        q2 = \(string(from: data.attitude_quaternions?.q2 ?? 0))
        q3 = \(string(from: data.attitude_quaternions?.q3 ?? 0))
        
        Date: \(data.date ?? "")
        """
    }
    
    private func string(from text: Double) -> String {
        String(format: "%.2f", text)
    }
}
// MARK: - Сетевой запрос для загрузки фото
extension DetailsOfEarthPhotoViewController {
    func fetchImage(from url: String) {
        NetworkManager.shared.fetchDataEarthPhoto(from: url) { data in
            DispatchQueue.main.async {
                self.imageOfPhoto.image = UIImage(data: data)
                self.activityIndicator.stopAnimating()
            }
        }
    }
}
