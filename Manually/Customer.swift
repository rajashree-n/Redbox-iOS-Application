//
//  Customer.swift
//  EmptyApp
//
//  Created by Rajashree Naik on 2/23/19.
//  Copyright © 2019 rab. All rights reserved.
//

import Foundation
class Customer {
    var cid: UUID
    var name: String?
    var age: Int?
    var email: String?
    var address: String?
    
    init(cid: UUID, name: String, age: String, email: String, address: String) {
        self.cid = cid
        self.name = name
        self.age = Int(age)
        self.email = email
        self.address = address
    }
    
    func add(name: String, age: String, email: String, address: String) {
        self.name = name
        self.age = Int(age)
        self.email = email
        self.address = address
    }
    
    func show(id:Int, name: String, age: Int, email: String, address: String) -> String{
        return("\(id):: \(self.name!) [\(self.age!)]yrs {\(self.email!)} - \(self.address!) ")
    }
    
    func shownames() -> String{
        return self.name!
    }
    
    func update(name: String, age: String, email: String, address: String){
        self.name = name
        self.age = Int(age)
        self.email = email
        self.address = address
    }
}
