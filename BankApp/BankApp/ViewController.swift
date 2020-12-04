//
//  ViewController.swift
//  BankApp
//
//  Created by Amarvir Mac on 25/11/20.
//  Copyright © 2020 Amarvir Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? MenuViewController
        vc?.name = username.text!
    }
    
    @IBAction func Login(_ sender: Any) {
        
       
        if password.text == "PWD"{
             
            performSegue(withIdentifier: "logintomenu", sender: self)
            
        }
        else {

            let ac = UIAlertController(title: "Error", message: "Wrong Password", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Dismiss", style: .default))
            self.present(ac, animated: true, completion: nil)
            
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

