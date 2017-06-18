//
//  Car.swift
//  Careo
//
//  Created by Karol Stępień on 14.06.2017.
//  Copyright © 2017 carlst. All rights reserved.
//

import RealmSwift
import ObjectMapper

class Car: Object, Mappable {

    dynamic var id = ""
    dynamic var name = ""
    dynamic var model = ""
    dynamic var brand = ""
    dynamic var year = ""

    convenience init(name: String, model: String, brand: String, year: String) {
        self.init()
        self.name = name
        self.model = model
        self.brand = brand
        self.year = year
    }

    override static func primaryKey() -> String? {
        return "id"
    }

    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        if map.mappingType == .fromJSON {
            id <- map["_id"]
        }
        name <- map["name"]
        model <- map["model"]
        brand <- map["brand"]
        year <- map["year"]
    }

}
