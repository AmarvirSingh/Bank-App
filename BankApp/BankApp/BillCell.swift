//
//  BillCell.swift
//  BankApp
//
//  Created by Amarvir Mac on 27/11/20.
//  Copyright © 2020 Amarvir Mac. All rights reserved.
//

import UIKit

class BillCell: UITableViewCell {

    
    @IBOutlet weak var PaymentInfo: UILabel!
    
    
        
    func setData(z:Accounts, x:Double ){
        PaymentInfo.text = " bill of $  \(x) has been paid from \(z.accountNumber) "
    }
    func setNoData(){
            
        PaymentInfo.text = "Check balance or account number"
    }
    
    func setValue(){
        PaymentInfo.text = ""
    }
    
}
