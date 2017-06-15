//
//  Service.swift
//  Careo
//
//  Created by Karol Stępień on 14.06.2017.
//  Copyright © 2017 carlst. All rights reserved.
//

import Alamofire
import RealmSwift
import AlamofireObjectMapper

class Service {
    var persistanceManager = PersistenceManager.sharedInstance
    var headers: [String: String] = [:]
    
    init() {
        self.headers = [
            "Content-Type": "application/json",
            "Accept": "application/json",
            "x-apikey": "5937f06b4b84c62d01db8a40" // shouldn't be hardcoded
        ]
    }
}
