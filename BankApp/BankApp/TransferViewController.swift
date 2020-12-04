//
//  TransferViewController.swift
//  BankApp
//
//  Created by Amarvir Mac on 26/11/20.
//  Copyright © 2020 Amarvir Mac. All rights reserved.
//

import UIKit

class TransferViewController: UIViewController {
    @IBOutlet weak var from: UITextField!
    
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var amount: UITextField!
    @IBOutlet weak var to: UITextField!
    var agree1 = false
    
    var agree = false
    var det = [Accounts]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        message.text = ""
        // Do any additional setup after loading the view.
    }
    

    @IBAction func withdraw(_ sender: Any) {
        if from.text != "" && to.text != "" && amount.text != "" && from.text != to.text{  // first confirming fields are not empty and to adn from accouny number are not the same
        for i in det{
            if from.text == i.accountNumber && i.balance >= Double(amount.text!)! {
               // agree1 = true
                    for j in det{
                    if j.accountNumber == to.text {
                        agree = true
                        i.balance -= Double(amount.text!)!
                        j.balance += Double(amount.text!)!
                                            
                    }
                }
            }
        }
      
                if agree == true {
                   message.text = "Transfer succesfully"
                           
                }
            }
    
        else {    // if any field is empty or account number are the same
                if from.text == to.text {    // iff account nuembr are same
                    message.text = "Can not transfer to same account !"

                }
                else{ // else fill all fields
                    message.text = ""
                    let ac = UIAlertController(title: "Alert !", message: "Please fill all the fields", preferredStyle: .alert)
                    ac.addAction(UIAlertAction(title: "Ok!", style: .default))
                    self.present(ac, animated: true, completion: nil)
                    
                }
                
                
                
            }

    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? MenuViewController
        vc?.details = det
    }
    
    
    @IBAction func goback(_ sender: Any) {
        
        performSegue(withIdentifier: "transfertomenu", sender: self)
    }
}
