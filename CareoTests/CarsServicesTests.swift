//
//  CarsServicesTests.swift
//  Careo
//
//  Created by Karol Stępień on 18.06.2017.
//  Copyright © 2017 carlst. All rights reserved.
//

import XCTest
import OHHTTPStubs
import RxRealm
import RxSwift
import RealmSwift
@testable import Careo

class CarsServicesTests: XCTestCase {

    var persistenceManager: PersistenceManager!
    var realm: Realm!

    override func setUp() {
        super.setUp()
        realm = try! Realm(configuration: Realm.Configuration(inMemoryIdentifier: self.name! + "MainRealm"))
        persistenceManager = PersistenceManager(realm: realm)
    }

    override func tearDown() {
        super.tearDown()
    }

    func testGetCars() {
        stub(condition: isScheme("http")) { _ in
            let path = OHPathForFile("CarsResponse.json", type(of: self))!
            return OHHTTPStubsResponse(fileAtPath: path,
                    statusCode: 200, headers: ["Content-Type": "application/json"])
        }

        CarsServices.sharedInstance.persistenceManager = persistenceManager
        let exp = expectation(description: "Request timed out.")

        let cars = persistenceManager.cars()
        _ = Observable.changeset(from: cars)
                .subscribe(onNext: { results, changes in
                    if changes != nil {
                        exp.fulfill()
                    }
                })

        CarsServices.sharedInstance.getCars()

        waitForExpectations(timeout: 5) { (error) in
            XCTAssertNil(error, "Completion closure not invoked")
            XCTAssert(self.persistenceManager.realm.objects(Car.self).count == 4, "Cars not persisted")
        }
    }

}
