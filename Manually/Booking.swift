//
//  Booking.swift
//  EmptyApp
//
//  Created by Rajashree Naik on 2/23/19.
//  Copyright © 2019 rab. All rights reserved.
//

import Foundation

class Booking {
    var bid: UUID
    var customer: Customer
    var movie: Movie
    var quant: Int
    var DateOfBooking: String?
    var DateOfReturn: Date?
    
    init(bid: UUID, movie: Movie, customer:Customer, quant:Int, DateOfBooking:String?, DateOfReturn:Date?) {
        self.bid = bid
        self.movie = movie
        self.customer = customer
        self.quant = 0
        self.DateOfBooking = DateOfBooking
        self.DateOfReturn = DateOfReturn
    }
    
    func show(id:Int, movie: Movie, customer:Customer, quant:Int, DateOfBooking:String?, DateOfReturn:Date?) -> String{
    return(" \(customer.name!): BOOKED -> \(movie.name!) [\(DateOfBooking!)] \(DateOfReturn!)  Qty: \(quant) \n")
    }
    
    func showdetail(bid: UUID, movie: Movie, customer:Customer, quant:Int, DateOfBooking:String?, DateOfReturn:Date?) -> String{
        return "Customer: \(self.customer.name!) \t Movie: \(self.movie.name!) \t UID: \(self.bid)"
    }
    
    
    func show(id:Int){
        print("Booking \(id+1):\n Unique ID: \(self.bid) \n Movie Name: \(self.movie.name!) \n Customer Name: \(self.customer.name!) \n Quantity: \(self.quant) \n Date of Booking: \(DateOfBooking!) \n Return Date: \(DateOfReturn!)")
    }
}

