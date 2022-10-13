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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingInformationButton()
    }
    
    private func settingInformationButton() {
        informationButton.setTitle("Random image every day", for: .normal)
        informationButton.setTitleColor(.white, for: .normal)
        informationButton.backgroundColor = .black
        informationButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        informationButton.layer.cornerRadius = 8
        
        marsRoverButton.setTitle("Mars rover photos", for: .normal)
        marsRoverButton.setTitleColor(.white, for: .normal)
        marsRoverButton.backgroundColor = .red
        marsRoverButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        marsRoverButton.layer.cornerRadius = 8
    }
}

