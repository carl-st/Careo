//
//  CarListViewModel.swift
//  Careo
//
//  Created by Karol Stępień on 15.06.2017.
//  Copyright © 2017 carlst. All rights reserved.
//

import RxSwift
import RxRealm
import RealmSwift

class CarListViewModel {
    
    var carsCollection: Observable<(AnyRealmCollection<Car>, RealmChangeset?)>
    var cars = PersistenceManager.sharedInstance.cars()
    
    init() {
        carsCollection = Observable.changeset(from: cars)
            .share()
    }

}
