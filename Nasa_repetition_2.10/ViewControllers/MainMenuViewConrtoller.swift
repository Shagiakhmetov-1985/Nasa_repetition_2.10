//
//  ViewController.swift
//  Nasa_repetition_2.10
//
//  Created by Marat Shagiakhmetov on 11.10.2022.
//

import UIKit

class MainMenuViewConrtoller: UIViewController {
    
    @IBOutlet weak var informationButton: UIButton!
    @IBOutlet weak var marsRoverButton: UIButton!
    @IBOutlet weak var detailsPhotoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingInformationButton()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
            
        case "randomImage":
            guard let navigationVC = segue.destination as? UINavigationController else { return }
            guard let randomImageVC = navigationVC.topViewController as? InformationViewController else { return }
            randomImageVC.fetchData(from: ApiManager.shared.nasaInformation)
        default:
            guard let navigationVC = segue.destination as? UINavigationController else { return }
            guard let earthPhotoVC = navigationVC.topViewController as? EarthPhotoViewController else { return }
            earthPhotoVC.fetchDataOfEarth(from: ApiManager.shared.earthDetails)
        }
    }
    
    private func settingInformationButton() {
        informationButton.setTitle("Random image every day", for: .normal)
        informationButton.setTitleColor(.white, for: .normal)
        informationButton.backgroundColor = UIColor(red: 35/255, green: 35/255, blue: 35/255, alpha: 1)
        informationButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        informationButton.layer.cornerRadius = 8
        
        marsRoverButton.setTitle("Earth photo", for: .normal)
        marsRoverButton.setTitleColor(.white, for: .normal)
        marsRoverButton.backgroundColor = UIColor(red: 55/255, green: 55/255, blue: 215/255, alpha: 1)
        marsRoverButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        marsRoverButton.layer.cornerRadius = 8
        
        detailsPhotoButton.setTitle("Details photo", for: .normal)
        detailsPhotoButton.setTitleColor(.white, for: .normal)
        detailsPhotoButton.backgroundColor = UIColor(red: 55/255, green: 185/255, blue: 55/255, alpha: 1)
        detailsPhotoButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        detailsPhotoButton.layer.cornerRadius = 8
    }
}

