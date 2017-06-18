//
//  CarDetailsViewController.swift
//  Careo
//
//  Created by Karol Stępień on 17.06.2017.
//  Copyright © 2017 carlst. All rights reserved.
//

import UIKit

class CarDetailsViewController: UIViewController {
    
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var brandLabel: UILabel!
    @IBOutlet private var modelLabel: UILabel!
    @IBOutlet private var yearLabel: UILabel!
    var viewModel: CarDetailsViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let viewModel = viewModel {
            nameLabel.text = viewModel.nameText
            brandLabel.text = "Brand: \(viewModel.brandText)"
            modelLabel.text = "Model: \(viewModel.modelText)"
            yearLabel.text = "Year: \(viewModel.yearText)"
        }
    }

}
