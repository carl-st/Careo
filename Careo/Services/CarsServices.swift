//
//  CarsServices.swift
//  Careo
//
//  Created by Karol Stępień on 14.06.2017.
//  Copyright © 2017 carlst. All rights reserved.
//

import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import RxAlamofire
import RxSwift
import RxCocoa

class CarsServices: Service {
    
    let bag = DisposeBag()
    
    static let sharedInstance = CarsServices()

    func getCars() {
        requestJSON(.get, Urls.baseUrl + "cars", parameters: nil, headers: headers)
            .mapArray(type: Car.self)
            .subscribe(onNext: {
                cars in
                print(cars)
                PersistenceManager.sharedInstance.createOrUpdate(cars)
            }, onError: {
                error in
                print(error)
            }, onCompleted: {
                
            }, onDisposed: {
                
            })
            .addDisposableTo(bag)
    }
    
    func addCar(car: Car) {
        let parameters = Mapper().toJSON(car)
        requestJSON(.post, Urls.baseUrl + "cars", parameters: parameters, headers: headers)
            .mapObject(type: Car.self)
            .subscribe(onNext: {
                car in
                print(car)
                PersistenceManager.sharedInstance.createOrUpdate(car)
            }, onError: {
                error in
                print(error)
            }, onCompleted: {
                
            }, onDisposed: {
                
            })
            .addDisposableTo(bag)
    }
    
}
