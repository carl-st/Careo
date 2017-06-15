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
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["_id"]
        name <- map["name"]
        model <- map["model"]
        brand <- map["brand"]
        year <- map["year"]
    }
    
}
