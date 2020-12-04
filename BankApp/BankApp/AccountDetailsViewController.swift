//
//  AccountDetailsViewController.swift
//  BankApp
//
//  Created by Amarvir Mac on 26/11/20.
//  Copyright © 2020 Amarvir Mac. All rights reserved.
//

import UIKit

 // including important protocols of table view
class AccountDetailsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1   // returns one beacuse we only need one cell with data
        
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = detailtable.dequeueReusableCell(withIdentifier: "DetailCell") as? detailCell
        
       if tempDet.count > 0 && indexPath.row < tempDet.count{   // ensuring that indexpath.row will not be higher than size of tempDet array
             let object = tempDet[indexPath.row]
             let n = tempDet[indexPath.row].accountNumber
            
            
            if n == accountNumber.text {                
                cell?.setDetails(c:object)
                 
            }
          return cell!
       }
        else
        {
               cell?.setnoDetails()
               return cell!
         
        }
  
    }
   
    
    
    
    @IBOutlet weak var detailOutlet: UIButton!

    var det = [Accounts]()
    var tempDet = [Accounts]()
    
    var accountTypes = ["1001","1002"]
    
    
    // this function will fill the tempDet array with the object of accounts type if account number entered by user is present
    func fillTemp(z:String){
        for i in det{
            if i.accountNumber == z{
                tempDet.append(i)
            }
        }
    }
    
    
    //  needed outlets
    @IBOutlet weak var detailtable: UITableView!
    @IBOutlet weak var accountNumber: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // important to call delegate and daatsource of table
        detailtable.delegate = self
        detailtable.dataSource = self
        fillTemp(z: accountTypes[0]) // as the view starts tempDet will be filled with data
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? MenuViewController
        vc?.details = det
    }
    
    
    
    @IBAction func getDetails(_ sender: Any) {
        tempDet.removeAll()    // removing everything from the tempDet array
        fillTemp(z:accountNumber.text!)  // refilling of tempDet array
        detailtable.reloadData()  // this reloads the content  of table view again
        
        
    }
    
    
    @IBAction func goback(_ sender: Any) {
        
        performSegue(withIdentifier: "detailstomenu", sender: self)
    }
    
}
