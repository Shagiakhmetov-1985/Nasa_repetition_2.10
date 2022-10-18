//
//  DetailsOfPhotoViewController.swift
//  Nasa_repetition_2.10
//
//  Created by Marat Shagiakhmetov on 17.10.2022.
//

import UIKit

class DetailsOfPhotoViewController: UIViewController {
    
    @IBOutlet weak var imageDetailsPhoto: UIImageView!
    @IBOutlet weak var labelEarthDate: UILabel!
    @IBOutlet weak var labelLandingDate: UILabel!
    @IBOutlet weak var labelLaunchDate: UILabel!
    @IBOutlet weak var labelStatus: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        fetchData(from: ApiManager.shared.earthPhoto)
    }
    
    @IBAction func undoButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    private func setup() {
        navigationItem.title = "Details photo"
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        labelEarthDate.isHidden = true
        labelLandingDate.isHidden = true
        labelLaunchDate.isHidden = true
        labelStatus.isHidden = true
    }
    
    private func fetchData(from url: String) {
        NetworkManager.shared.fetchDataEarthPhoto(from: url) { data in
            guard let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self.imageDetailsPhoto.image = image
                self.activityIndicator.stopAnimating()
            }
        }
//        NetworkManager.shared.fetchDataEarthPhoto(from: url) { camera in
//            DispatchQueue.main.async {
//                self.labelEarthDate.text = "Earth date: " + (camera.first?.earth_date ?? "")
//                self.labelLandingDate.text = "Landing date: " + (camera.first?.rover?.landing_date ?? "")
//                self.labelLaunchDate.text = "Launch date: " + (camera.first?.rover?.launch_date ?? "")
//                self.labelStatus.text = "Status: " + (camera.first?.rover?.status ?? "")
//                self.labelEarthDate.isHidden = false
//                self.labelLandingDate.isHidden = false
//                self.labelLaunchDate.isHidden = false
//                self.labelStatus.isHidden = false
//
//                guard let url = URL(string: camera.first?.img_src ?? "") else { return }
//
//                DispatchQueue.global().async {
//                    guard let imageData = try? Data(contentsOf: url) else { return }
//
//                    DispatchQueue.main.async {
//                        self.imageDetailsPhoto.image = UIImage(data: imageData)
//                        self.activityIndicator.stopAnimating()
//                    }
//                }
//            }
//        }
    }
}
