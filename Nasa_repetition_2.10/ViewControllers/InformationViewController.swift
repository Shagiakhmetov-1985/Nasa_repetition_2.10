//
//  InformationViewController.swift
//  Nasa_repetition_2.10
//
//  Created by Marat Shagiakhmetov on 11.10.2022.
//

import UIKit

class InformationViewController: UIViewController {
    
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var tagsLabel: UILabel!
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var explanationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData(from: ApiManager.shared.nasaInformation)
    }
    
    @IBAction func undoButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    private func fetchData(from url: String) {
        NetworkManager.shared.fetchData(from: url) { information in
            DispatchQueue.main.async {
                self.authorLabel.text = information.copyright
                self.tagsLabel.text = information.title
                self.explanationLabel.text = information.explanation
            }
            
            guard let url = URL(string: information.url ?? "") else { return }
            
            DispatchQueue.global().async {
                guard let imageData = try? Data(contentsOf: url) else { return }
                
                DispatchQueue.main.async {
                    self.photoImage.image = UIImage(data: imageData)
                }
            }
        }
    }
}
