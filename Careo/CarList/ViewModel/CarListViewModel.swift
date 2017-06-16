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
    
//    var carsCollection: Observable<String>
    var carsCollection: Observable<(AnyRealmCollection<Car>, RealmChangeset?)>
    
    init() {
        let cars = PersistenceManager.sharedInstance.cars()
        carsCollection = Observable.changeset(from: cars)
            .share()
    }

}
