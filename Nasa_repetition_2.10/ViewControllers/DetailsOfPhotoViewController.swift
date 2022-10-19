//
//  DetailsOfPhotoViewController.swift
//  Nasa_repetition_2.10
//
//  Created by Marat Shagiakhmetov on 17.10.2022.
//

import UIKit

class DetailsOfPhotoViewController: UIViewController {
    
    @IBOutlet weak var imageDetailsPhoto: UIImageView!
    @IBOutlet weak var labelMarsData: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var data: Camera!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        navigationItem.title = "Details photo"
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        
        labelMarsData.font = UIFont.systemFont(ofSize: 22)
        labelMarsData.text = """
        ID: \(data.id ?? 0)
        
        Earth date: \(data.earth_date ?? "")
        
        Landing date: \(data.rover.landing_date ?? "")
        
        Launch date: \(data.rover.launch_date ?? "")
        
        Status: \(data.rover.status ?? "")
        """
        
        guard let url = URL(string: data.img_src ?? "") else { return }
        
        DispatchQueue.global().async {
            guard let image = try? Data(contentsOf: url) else { return }
            
            DispatchQueue.main.async {
                self.imageDetailsPhoto.image = UIImage(data: image)
                self.activityIndicator.stopAnimating()
            }
        }
    }
}
