//
//  CarListTableViewCell.swift
//  Careo
//
//  Created by Karol Stępień on 15.06.2017.
//  Copyright © 2017 carlst. All rights reserved.
//

import UIKit

class CarListTableViewCell: UITableViewCell {

    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var brandLabel: UILabel!
    @IBOutlet private var modelLabel: UILabel!
    @IBOutlet private var yearLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func config(withCar car: Car){
        nameLabel.text = "\(car.name)"
        brandLabel.text = "\(car.brand)"
        modelLabel.text = "\(car.model)"
        yearLabel.text = "\(car.year)"
    }

}
