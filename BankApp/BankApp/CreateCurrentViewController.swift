//
//  CreateViewController.swift
//  BankApp
//
//  Created by Amarvir Mac on 26/11/20.
//  Copyright © 2020 Amarvir Mac. All rights reserved.
//

import UIKit

class CreateCurrentViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return types.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return types[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        BusinessName.text = types[row]
        BusinessName.resignFirstResponder()
    }
    
    
    
    
    
    
    
    
    
    @IBOutlet weak var AccountNumber: UILabel!
    @IBOutlet weak var Balance: UITextField!
    @IBOutlet weak var Address: UITextView!
    @IBOutlet weak var Age: UITextField!
    @IBOutlet weak var ContactNumber: UITextField!
    @IBOutlet weak var BusinessName: UITextField!
    @IBOutlet weak var Name: UITextField!
    
    
    var picker = UIPickerView()
    
    
    var lastvalue = 0
    var det = [Accounts]()
    var acNumber = ["1001","1002","1003"]
    
    var types = ["Current Account", "Salary Account"]
    
    
    func getAccount() -> Int{
        for i in acNumber {
            lastvalue = Int(i)!
        }
        lastvalue += 1
        return lastvalue
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BusinessName.inputView = picker
        picker.delegate = self
        picker.dataSource = self
        
        AccountNumber.text = "Account Number : \(getAccount())"
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? MenuViewController
        vc?.details = det
        vc?.accountNumber = acNumber
    }
    
    
    @IBAction func goBack(_ sender: Any) {
        
        performSegue(withIdentifier: "createtomenu", sender: self)
        
    }
    
    @IBAction func CreateAccount(_ sender: Any) {
        
        if BusinessName.text != "" && Name.text != "" && Age.text != "" && ContactNumber.text != "" && Address.text != "" && Balance.text != ""{
            
        det.append(Accounts(type: BusinessName.text! , accNumber: String(lastvalue), name: Name.text! , age: Age.text!, contact: ContactNumber.text!, address: Address.text! , bal: Double(Balance.text!)!))
        acNumber.append(String(lastvalue))
       
        
            let ac = UIAlertController(title: "Alert", message: "Account Created ", preferredStyle: .alert)
                      ac.addAction(UIAlertAction(title: "Ok ", style: .default))
                      self.present(ac, animated: true, completion: nil)
          
            
        }
        else {
            let ac = UIAlertController(title: "Alert", message: "Please fill all the Fields !!!!", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Try again", style: .default))
            self.present(ac, animated: true, completion: nil)
        }
    }
    
    
    
   
}
