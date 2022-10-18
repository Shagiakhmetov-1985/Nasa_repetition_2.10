//
//  MarsRoverPhotosViewController.swift
//  Nasa_repetition_2.10
//
//  Created by Marat Shagiakhmetov on 12.10.2022.
//

import UIKit

class EarthPhotoViewController: UITableViewController {
    
    private var photoOfEarth = UIImage()
    private var dataOfEarth: [Earth] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataOfEarth.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EarthPhotoTableViewCell
        let data = dataOfEarth[indexPath.row]
        cell.configure(with: data)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let photoOfEarthVC = segue.destination as? DetailsOfEarthPhotoViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let data = dataOfEarth[indexPath.row]
        photoOfEarthVC.data = data
    }
    
    @IBAction func undoButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    private func setup() {
        navigationItem.title = "Earth photo"
        tableView.rowHeight = 50
    }
    
    func fetchDataOfEarth(from url: String) {
        NetworkManager.shared.fetchDataOfEarth(from: url) { data in
            DispatchQueue.main.async {
                self.dataOfEarth = data
                self.tableView.reloadData()
            }
        }
    }
    
    private func string(value: Int) -> String {
        return String(value)
    }
}
