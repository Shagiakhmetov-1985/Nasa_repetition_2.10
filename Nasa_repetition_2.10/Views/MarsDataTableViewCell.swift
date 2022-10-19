//
//  MarsDataTableViewCell.swift
//  Nasa_repetition_2.10
//
//  Created by Marat Shagiakhmetov on 19.10.2022.
//

import UIKit

class MarsDataTableViewCell: UITableViewCell {
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelPageNumber: UILabel!
    
    func configure(with data: Camera, and number: Int) {
        labelDescription.text = "Identifier: \(data.id ?? 0)"
        labelPageNumber.text = "Page: \(number + 1)"
    }
}
