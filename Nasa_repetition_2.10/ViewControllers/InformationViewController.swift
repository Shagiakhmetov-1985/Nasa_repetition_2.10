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
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    @IBAction func undoButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    private func setup() {
        navigationItem.title = "Random image"
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        authorLabel.isHidden = true
        tagsLabel.isHidden = true
        explanationLabel.isHidden = true
    }
    
    func fetchData(from url: String) {
        NetworkManager.shared.fetchDataInformation(from: url) { information in
            DispatchQueue.main.async {
                self.authorLabel.text = "Author: " + (information.copyright ?? "")
                self.tagsLabel.text = "Tags: " + (information.title ?? "")
                self.explanationLabel.text = "Explanation: " + (information.explanation ?? "")
                self.authorLabel.isHidden = false
                self.tagsLabel.isHidden = false
                self.explanationLabel.isHidden = false
            }
            
            guard let url = URL(string: information.url ?? "") else { return }
            
            DispatchQueue.global().async {
                guard let imageData = try? Data(contentsOf: url) else { return }
                
                DispatchQueue.main.async {
                    self.photoImage.image = UIImage(data: imageData)
                    self.activityIndicator.stopAnimating()
                }
            }
        }
    }
}
