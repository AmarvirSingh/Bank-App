//
//  Accounts.swift
//  BankApp
//
//  Created by Amarvir Mac on 26/11/20.
//  Copyright © 2020 Amarvir Mac. All rights reserved.
//

import Foundation

class Accounts{
    var type:String
    var accountNumber:String
    var name:String
    var contact:String
    var age:String
    var Address:String
    var balance:Double
    
    init(type:String, accNumber:String, name:String, age:String, contact:String, address:String, bal:Double) {
        self.type = type
        self.accountNumber = accNumber
        self.name = name
        self.age = age
        self.contact = contact
        self.Address = address
        self.balance = bal
    }
}
