//
//  MenuViewController.swift
//  BankApp
//
//  Created by Amarvir Mac on 26/11/20.
//  Copyright © 2020 Amarvir Mac. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController{
    
    @IBOutlet weak var welcomeUser: UILabel!  // label to welcome the user
    var details = [Accounts]() // array of types account
    var accountNumber = ["1001","1002","1003"] // these are the initial account numbes which are stored in th application
    var name = ""   // this variable is used to store username which is passed from login view controller
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeUser.text = "Welcome " + name

        fillData() // calling this fucntion whenever the view is loaded
    }
    
   // preparing segues for every button
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dVC = segue.destination as? DepositViewController
        dVC?.det = details
        
        let wVC = segue.destination as? WithdrawViewController
               wVC?.det = details
        
        let tVC = segue.destination as? TransferViewController
               tVC?.det = details
        
        let cVC = segue.destination as? CreateCurrentViewController
               cVC?.det = details
        cVC?.acNumber = accountNumber
        
        let bVC = segue.destination as? ShowBalanceViewController
               bVC?.det = details
        
        let gVC = segue.destination as? AccountDetailsViewController
               gVC?.det = details
        
        let billVC = segue.destination as? PayBillsViewController
               billVC?.det = details
               billVC?.accountNumber = accountNumber
        
    }
    
    
    
    
    
    
    
    
    
    
    // this function contains predefined data
    func fillData(){
        details.append(Accounts(type: "Current Account", accNumber:"1001" , name: "Amarvir Singh", age: "21", contact: "9781355869", address: "#318 village lakhnaur Mohali Punjab",bal: 2500))
        details.append(Accounts(type: "Salary Account", accNumber:"1002", name: "SimranPreet Kaur", age: "20", contact: "9876583122", address: "#123 sector 2 Chandigarh Chandigarh", bal : 2000))
        details.append(Accounts(type: "Current Account", accNumber:"1003", name: "Rajveer Kaur", age: "19", contact: "9876543215", address: "#548 Lakhnaur Street, Toronto, Canada ", bal : 3000))
    }
    
    
    // this is for creating an account
    @IBAction func createAccount(_ sender: Any) {
           
        
        performSegue(withIdentifier: "menutocreate", sender: self)
        }
    
    // ehenever this button is clicked control will be shifted to another  ShowBalanceView Controller
    @IBAction func showBalance(_ sender: Any) {

        performSegue(withIdentifier: "menutobalance", sender: self)
        
    }
    
    // shits control to account details view controller
    
    @IBAction func getDetails(_ sender: Any) {
        /*
        let dVc = self.storyboard?.instantiateViewController(identifier: "AccountDetailsViewController") as! AccountDetailsViewController
        dVc.det = details // passing details array to account details view controeller
        self.navigationController?.pushViewController(dVc, animated: true)
 */
        performSegue(withIdentifier: "menutodetails", sender: self)
        
 }
    
    
    // shifts control to pay bills view controller
    @IBAction func paybills(_ sender: Any) {
/*        let pVc = self.storyboard?.instantiateViewController(identifier: "PayBillsViewController") as! PayBillsViewController
        pVc.det = details
        pVc.accountNumber = accountNumber
        self.navigationController?.pushViewController(pVc, animated: true)
  */
    
        performSegue(withIdentifier: "menutobills", sender: self)
    }
    
    
    // shifts control to deposit view controller
    @IBAction func deposit(_ sender: Any) {
        
    /*    let vc = self.storyboard?.instantiateViewController(identifier: "DepositViewController") as! DepositViewController
        vc.det = details
        self.navigationController?.pushViewController(vc , animated: true)
      */
        
        performSegue(withIdentifier: "menutodeposit", sender: self)
    }
    
    
    // shifts control to withdraw view controller
    @IBAction func withdraw(_ sender: Any) {
/*        let vc = self.storyboard?.instantiateViewController(identifier: "WithdrawViewController") as! WithdrawViewController
        vc.det = details
        self.navigationController?.pushViewController(vc , animated: true)
*/
        performSegue(withIdentifier: "menutowithdraw", sender: self)
    }
    
    
    // shifts control to transfer view controller
    @IBAction func transfer(_ sender: Any) {
/*        let vc = self.storyboard?.instantiateViewController(identifier: "TransferViewController") as!    TransferViewController
        
        vc.det = details
        self.navigationController?.pushViewController(vc, animated: true)
  */
        performSegue(withIdentifier: "menutotransfer", sender: self)
    }
}
