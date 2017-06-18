//
//  CarDetailsViewModelTests.swift
//  Careo
//
//  Created by Karol Stępień on 18.06.2017.
//  Copyright © 2017 carlst. All rights reserved.
//

import XCTest
@testable import Careo

class CarDetailsViewModelTests: XCTestCase {

    var car = Car(name: "Berlinetta", model: "F12", brand: "Ferrari", year: "2012")

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testCarDetailsModel() {
        let model = CarDetailsViewModel(car: car)
        XCTAssert(model.brandText == "Brand: Ferrari", "brand text is incorrect")
        XCTAssert(model.nameText == "Berlinetta", "name text is incorrect")
        XCTAssert(model.modelText == "Model: F12", "model text is incorrect")
        XCTAssert(model.yearText == "Year: 2012", "year text is incorrect")
    }


}
