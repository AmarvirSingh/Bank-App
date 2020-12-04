//
//  WithdrawViewController.swift
//  BankApp
//
//  Created by Amarvir Mac on 26/11/20.
//  Copyright © 2020 Amarvir Mac. All rights reserved.
//

import UIKit

class WithdrawViewController: UIViewController {

  // creating needed outlets
    @IBOutlet weak var amount: UITextField!
    @IBOutlet weak var AccountNumber: UITextField!
    
    //created this array of account type which will be filled when control shofted to this view controller
    var det = [Accounts]()


    
    override func viewDidLoad() {
        super.viewDidLoad()
        message1.text = ""
       
    }
    
    // creating bollean value to check whether the money is withdrawed or not
    var agree1 = false
    
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? MenuViewController
        vc?.details = det
    }
    
    
    @IBAction func withdraw(_ sender: Any) {
        
        for i in 0..<det.count{
            if det[i].accountNumber == AccountNumber.text! && det[i].balance >= Double(amount.text!)!{

                det[i].balance -= Double(amount.text!)!
                
                /*let vc = self.storyboard?.instantiateViewController(identifier: "MenuViewController") as! MenuViewController
                vc.details = det // passing filled det array with new vaues to menu view  controller*/
                agree1 = true
                break  // break is needed beacuse whenever account and balance is present it stops further function of for loop
 
                
                }
            else {
                agree1 = false
            }
            }
        
        if agree1 == false {
            message1.text = ""
            message1.text = "Account Balance is low or account is not present"
        }
        else {
            message1.text = "\(amount.text!) Dollars withdrawed"
        }
        
    }
    
    @IBAction func goback(_ sender: Any) {

        performSegue(withIdentifier: "withdrawtomenu", sender: self)
    }
    
    
    
    
    
    
    @IBOutlet weak var message1: UILabel!   //label of message 
    
}
