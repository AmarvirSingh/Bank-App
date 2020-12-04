//
//  ShowBalanceViewController.swift
//  BankApp
//
//  Created by Amarvir Mac on 26/11/20.
//  Copyright © 2020 Amarvir Mac. All rights reserved.
//

import UIKit

class ShowBalanceViewController: UIViewController {

    
    
    
    @IBOutlet weak var accountField: UITextField!
    
    var det = [Accounts]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
var Agree = false
    @IBAction func getBalance(_ sender: Any) {
   
        for i in 0..<det.count{
            if det[i].accountNumber == accountField.text! {
                let ac = UIAlertController(title: "Message !!! ", message: "Available Balance In Your Account is \(det[i].balance)", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: " OK ", style: .default))
                self.present(ac, animated: true, completion: nil)
                Agree = false
            }
            else {
                Agree = true
                
            }
        }
        
        if Agree == true{
            let ac = UIAlertController(title: "Message !!! ", message: "Account Not found !", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: " OK ", style: .default))
            self.present(ac, animated: true, completion: nil)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? MenuViewController
        vc?.details = det
    }
    
    
    @IBAction func goback(_ sender: Any) {
        
        performSegue(withIdentifier: "balancetomenu", sender: self)
    }
    
    
    
}
