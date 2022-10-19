//
//  MarsRoverPhotosViewController.swift
//  Nasa_repetition_2.10
//
//  Created by Marat Shagiakhmetov on 12.10.2022.
//

import UIKit

class EarthPhotoViewController: UITableViewController {
    
    private var dataOfEarth: [Earth] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    // MARK: - Количество строк в таблице
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataOfEarth.count
    }
    // MARK: - Настройка каждой ячейки в таблице
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EarthPhotoTableViewCell
        let data = dataOfEarth[indexPath.row]
        cell.configure(with: data)
        return cell
    }
    // MARK: - Переход к вьюконтроллеру и вызов метода для сетевого запроса при нажатии на ячейку в таблице
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let photoOfEarthVC = segue.destination as? DetailsOfEarthPhotoViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let data = dataOfEarth[indexPath.row]
        photoOfEarthVC.data = data
        photoOfEarthVC.fetchImage(from: ApiManager.shared.earthPhoto)
    }
    
    @IBAction func undoButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    private func setup() {
        navigationItem.title = "Earth photo"
        tableView.rowHeight = 50
    }
}
// MARK: - Сетевой запрос для получений данных для таблицы
extension EarthPhotoViewController {
    func fetchDataOfEarth(from url: String) {
        NetworkManager.shared.fetchDataOfEarth(from: url) { data in
            DispatchQueue.main.async {
                self.dataOfEarth = data
                self.tableView.reloadData()
            }
        }
    }
}
