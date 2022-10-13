//
//  PhotoOfRoverViewController.swift
//  Nasa_repetition_2.10
//
//  Created by Marat Shagiakhmetov on 13.10.2022.
//

import UIKit

class PhotoOfRoverViewController: UIViewController {
    
    @IBOutlet weak var imageOfPhoto: UIImageView!
    @IBOutlet weak var labelOfDateEarth: UILabel!
    @IBOutlet weak var labelOfLandingDate: UILabel!
    @IBOutlet weak var labelOfLaunchDate: UILabel!
    @IBOutlet weak var labelOfStatus: UILabel!
    
    var data: Camera!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        print(data ?? 0)
//        imageOfPhoto.image = UIImage(named: data.img_src)
//        labelOfDateEarth.text = "Date of Earth: " + data.earth_date
//        labelOfLandingDate.text = "Date of landing: " + data.rover.landing_date
//        labelOfLaunchDate.text = "Date of launch: " + data.rover.launch_date
//        labelOfStatus.text = "Status: " + data.rover.status
    }
}
