//
//  MarsListViewController.swift
//  Nasa_repetition_2.10
//
//  Created by Marat Shagiakhmetov on 19.10.2022.
//

import UIKit

class MarsListViewController: UITableViewController {
    
    private var dataOfMars: [Camera] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataOfMars.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MarsDataTableViewCell
        let data = dataOfMars[indexPath.row]
        cell.configure(with: data, and: indexPath.row)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let marsData = segue.destination as? DetailsOfPhotoViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let data = dataOfMars[indexPath.row]
        marsData.data = data
    }
    
    @IBAction func undoButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    private func setup() {
        navigationItem.title = "Mars photos"
        tableView.rowHeight = 40
    }
}

extension MarsListViewController {
    func fetchData(from url: String) {
        NetworkManager.shared.fetchMarsRoverPhotos(from: url) { data in
            DispatchQueue.main.async {
                self.dataOfMars = data
                self.tableView.reloadData()
            }
        }
    }
}
