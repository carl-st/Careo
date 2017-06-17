//
//  CarDetailsViewModel.swift
//  Careo
//
//  Created by Karol Stępień on 17.06.2017.
//  Copyright © 2017 carlst. All rights reserved.
//

import Foundation

class CarDetailsViewModel {
    
    var car: Car?
    var nameText = ""
    var brandText = ""
    var modelText = ""
    var yearText = ""

    convenience init(car: Car) {
        self.init()
        self.car = car
        nameText = car.name
        brandText = car.brand
        modelText = car.model
        yearText = car.year
    }
    
}
