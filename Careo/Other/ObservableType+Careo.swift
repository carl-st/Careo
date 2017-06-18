//
//  ObservableType+Careo.swift
//  Careo
//
//  Created by Karol Stępień on 15.06.2017.
//  Copyright © 2017 carlst. All rights reserved.
//

import ObjectMapper
import RxAlamofire
import RxSwift

fileprivate var mappingError = NSError(
        domain: "",
        code: -1,
        userInfo: [NSLocalizedDescriptionKey: "ObjectMapper can't map given data"]
)

extension ObservableType {

    public func mapObject<T:Mappable>(type: T.Type) -> Observable<T> {
        return flatMap { data -> Observable<T> in
            print(data)
            let (_, json) = (data as? (HTTPURLResponse, Any))!
            guard let object = Mapper<T>().map(JSONObject: json) else {
                throw mappingError
            }

            return Observable.just(object)
        }
    }

    public func mapArray<T:Mappable>(type: T.Type) -> Observable<[T]> {
        return flatMap { data -> Observable<[T]> in
            let (_, json) = (data as? (HTTPURLResponse, Any))!
            guard let objects = Mapper<T>().mapArray(JSONObject: json) else {
                throw mappingError
            }

            return Observable.just(objects)
        }
    }

}
