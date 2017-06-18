//
//  ModelTests.swift
//  CareoTests
//
//  Created by Karol Stępień on 18.06.2017.
//  Copyright © 2017 carlst. All rights reserved.
//

import XCTest
import ObjectMapper
@testable import Careo

class ModelTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testCar() {
        let car = Car(JSON: [
                "_id": "594509e31d376f5800000067",
                "name": "Superfast",
                "model": "812",
                "brand": "Ferrari",
                "year": "2017",
        ])

        XCTAssert(car!.id == "594509e31d376f5800000067", "id value invalid")
        XCTAssert(car!.name == "Superfast", "name value invalid")
        XCTAssert(car!.model == "812", "model value invalid")
        XCTAssert(car!.brand == "Ferrari", "brand value invalid")
        XCTAssert(car!.year == "2017", "year value invalid")
    }

}
