//
//  Movie.swift
//  EmptyApp
//
//  Created by Rajashree Naik on 2/23/19.
//  Copyright © 2019 rab. All rights reserved.
//

import Foundation
class Movie {
    var mid: UUID
    var name: String?
    var yearOfRelease: Int?
    var genre: String?
    var quant: Int
    
    init(mid: UUID, name: String, year: String, genre: String, quant: String) {
        self.mid = mid
        self.name = name
        let tyor: String? = year
        self.yearOfRelease = Int(tyor!)
        self.genre = genre
        self.quant = Int(quant)!
    }
    func addDefault() {
        
        self.name = "DDLJ"
        let tyor: String? = "2000"
        self.yearOfRelease = Int(tyor!)
        self.genre = "DRAMA"
        self.quant = 5
    }
    
    func add(name: String, year: String, genre: String, quant: String) {
        self.name = name
        let tyor: String? = year
        self.yearOfRelease = Int(tyor!)
        self.genre = genre
        self.quant = Int(quant)!
    }
    
    func show(id:Int, mid: UUID, name: String, year: Int, genre: String, quant: Int) -> String{
        return("Movie \(id): \(name) [\(year)] \(genre)  Qty: \(quant) \n")
    }
    
    func shownames() -> String{
        return self.name!
    }
    
    func showQ() -> Int {
        return self.quant
    }
    func update(name: String, year: String, genre: String, quant: String){
        self.name = name
        self.yearOfRelease = Int(year)
        self.genre = genre
        self.quant = Int(quant)!
    }
}

