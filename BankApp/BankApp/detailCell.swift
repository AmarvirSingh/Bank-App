//
//  detailCell.swift
//  BankApp
//
//  Created by Amarvir Mac on 26/11/20.
//  Copyright © 2020 Amarvir Mac. All rights reserved.
//

import UIKit

class detailCell: UITableViewCell {

    @IBOutlet weak var AccountDetails: UILabel!
    
    
    func setDetails (c:Accounts){
        AccountDetails.text = " Name : \(c.name) \n  Age : \(c.age) \n Address : \(c.Address) \n Contact :  \(c.contact) \n Balance : \(c.balance) Dollars \n Account Type : \(c.type)"
    }
    func setnoDetails(){
        AccountDetails.text = "Sorry No Account found"
    }

}
