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
//    var request: () -> ()?
    
    static let sharedInstance = CarsServices()

    func getCars() {
         requestJSON(.get, Urls.baseUrl + "cars", parameters: nil, headers: headers)
            .mapArray(type: Car.self)
            .subscribe(onNext: {
                cars in
                print(cars)
                self.persistenceManager.createOrUpdateAndRemoveDeleted(cars)
            }, onError: {
                error in
                print(error)
            }, onCompleted: {
                
            }, onDisposed: {
                
            })
            .addDisposableTo(bag)
    }
    
    func addCar(car: Car, completion: @escaping () -> Void) {
        let parameters = Mapper().toJSON(car)
        requestJSON(.post, Urls.baseUrl + "cars", parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .mapObject(type: Car.self)
            .subscribe(onNext: {
                car in
                print(car)
                self.persistenceManager.createOrUpdate(car)
                completion()
            }, onError: {
                error in
                print(error)
            }, onCompleted: {
                
            }, onDisposed: {
                
            })
            .addDisposableTo(bag)
    }
    
}
