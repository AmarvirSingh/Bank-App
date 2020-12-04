//
//  DepositViewController.swift
//  BankApp
//
//  Created by Amarvir Mac on 26/11/20.
//  Copyright © 2020 Amarvir Mac. All rights reserved.
//

import UIKit

class DepositViewController: UIViewController {

    
    
    
    //******************** needed OUtlets ********************
    @IBOutlet weak var accountNumber: UITextField!
    @IBOutlet weak var message: UITextField!
    @IBOutlet weak var amount: UITextField!
    
    // ************  Creating aray of account types and it will be filled with passed array from menu view controller
    var det = [Accounts]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? MenuViewController
        vc?.details = det
    }
    
    
    var agree = false  // craeting boolan variable to check whether the moeny is deposited or not
    @IBAction func deposit(_ sender: Any) {
        
        for i in 0..<det.count {
            if det[i].accountNumber == accountNumber.text!{
            det[i].balance += Double(amount.text!)!
                agree = true   /// agree will be true bcause money has be deposited
            }
        }
        
        if agree == true {
             message.text = ""
            message.text = "$ \(amount.text!) has been deposited to your Bank account"
            
            
        }
        else{
            message.text = ""
            message.text = "So Sorry to say but Account not found " // just wriitng the message
            
            
        }
        
    }
    @IBAction func goback(_ sender: Any) {
        
        performSegue(withIdentifier: "deposittomenu", sender: self)
    }
    
}
