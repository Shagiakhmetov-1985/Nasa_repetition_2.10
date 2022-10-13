//
//  MarsRoverPhotosViewController.swift
//  Nasa_repetition_2.10
//
//  Created by Marat Shagiakhmetov on 12.10.2022.
//

import UIKit

class MarsRoverPhotosViewController: UITableViewController {
    
    private var dataOfMars: [Camera] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        fetchData(from: ApiManager.shared.marsRoverPhotos)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataOfMars.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MarsRoverPhotosTableViewCell
        let data = dataOfMars[indexPath.row]
        cell.configure(with: data)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationVC = segue.destination as? UINavigationController else { return }
        guard let photoOfRoverVC = navigationVC.topViewController as? PhotoOfRoverViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let data = dataOfMars[indexPath.row]
        photoOfRoverVC.data = data
    }
    
    @IBAction func undoButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    private func setup() {
        navigationItem.title = "Mars rover photos"
        tableView.rowHeight = 80
    }
    
    private func fetchData(from url: String) {
        NetworkManager.shared.fetchDataMarsPhotos(from: url) { camera in
            DispatchQueue.main.async {
                self.dataOfMars = camera
                self.tableView.reloadData()
            }
        }
    }
    
    private func string(value: Int) -> String {
        return String(value)
    }
}
