//
//  PayBillsViewController.swift
//  BankApp
//
//  Created by Amarvir Mac on 26/11/20.
//  Copyright © 2020 Amarvir Mac. All rights reserved.
//

import UIKit

class PayBillsViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UITableViewDelegate,UITableViewDataSource {
   
     //***************************************************
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = BillTable.dequeueReusableCell(withIdentifier: "billCell") as? BillCell
        
        if tempDet.count > 0 && indexPath.row < tempDet.count && amountPaid == true{
                   let object = tempDet[indexPath.row]
                    let n = tempDet[indexPath.row].accountNumber
         //   let b = tempDet[indexPath.row].balance
                        
                
            if n == accountNum.text {
                    cell?.setData(z: object, x: Double(billAmount.text!)!)
                    amountPaid = false
            }
            return cell!
             
        }
        else
               {
                cell?.setNoData()
                return cell!
        }
        
        
         
        }

    
    
   
    
   
    
     //***************************************************
    
    
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
        selectBill.text = types[row]
        selectBill.resignFirstResponder()
    }

     //***************************************************
    
    
    @IBOutlet weak var selectBill: UITextField!
   
    @IBOutlet weak var BillTable: UITableView!
    
    
    @IBOutlet weak var accountNum: UITextField!
    @IBOutlet weak var billAmount: UITextField!
    
    
    
    var det = [Accounts]()
    var tempDet = [Accounts]()
    
    
    
    var accountNumber = [String]()
    var Picker = UIPickerView()
    
    var types = ["Electricity Bill","Water Bill","BroadBand Bill","DTH Recharge"]
    
     //***************************************************
    
    
    
    func fillTemp(z:String){
        for i in det{
            if i.accountNumber == z{
                tempDet.append(i)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectBill.inputView = Picker
       
        Picker.delegate = self
        Picker.dataSource = self
        
        BillTable.delegate = self
        BillTable.dataSource = self
        
        
        fillTemp(z: accountNumber[0])
    }
    
    var amountPaid = false
    var PaymentAmount = 0.0
    
    @IBAction func payBill(_ sender: Any) {
        tempDet.removeAll()
        fillTemp(z: accountNum.text!)
        for i in tempDet {
            //var availableBalance = i.balance
            PaymentAmount = Double(billAmount.text!)!
            
            if i.accountNumber == String(accountNum.text!) && i.balance >= PaymentAmount{
                i.balance -= PaymentAmount
                //i.balance = availableBalance
                amountPaid = true
                tempDet.append(i)
            }
            
        }
        
        BillTable.reloadData()
        
        
        /*let vc = self.storyboard?.instantiateViewController(identifier: "MenuViewController") as! MenuViewController
        vc.details = tempDet
        */
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? MenuViewController
        vc?.details = tempDet
    }
    
    @IBAction func goback(_ sender: Any) {
        performSegue(withIdentifier: "billstomenu", sender: self)
    }
    
    
}
