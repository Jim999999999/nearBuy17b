//
//  ItemTableViewController.swift
//  nearBuy17
//
//  Created by Jim on 11/19/21.
//

import UIKit
import CoreData

class ItemTableViewController: UITableViewController {
    
    var itemArray = ["Apples", "Bananas", "Corn", "Dog Food"]
    var brandArray = ["none", "none", "DelMonte", "Alpo"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startUpItems()
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return itemArray.count
    }
    

     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
         let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
         let item = itemArray[indexPath.row]
         //let brand = brandArray[indexPath.row]
          
         
         cell.textLabel?.text = item //.itemName
         cell.accessoryType = .checkmark //item.needed ? .checkmark : .none
         //cell.detailTextLabel?.text = brand
         cell.imageView?.image = UIImage(named: "BlueW")
       
     
     
     return cell
     }
     
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    func startUpItems()  {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.hidesBarsOnSwipe = true
        navigationItem.title = "Items"
        
        navigationItem.leftBarButtonItems = [loginBarButtonItem, helpBarButtonItem]
        navigationItem.rightBarButtonItems = [addItemsBarButtonItem, storesBarButtonItem]
        
    }
    
    lazy var helpBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(title: "Help", style: .plain, target: self, action: #selector(helpTapped))
        barButtonItem.tintColor = UIColor(named: "Dark")
        return barButtonItem
    }()
    
    lazy var loginBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(title: "LogIn", style: .plain, target: self, action: #selector(loginTapped))
        barButtonItem.tintColor = UIColor(named: "Dark")
        return barButtonItem
    }()
    
    lazy var addItemsBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(title: "Add Item", style: .plain, target: self, action: #selector(addItemsTapped))
        barButtonItem.tintColor = UIColor(named: "Dark")
        return barButtonItem
    }()
    
    lazy var storesBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(title: "Stores", style: .plain, target: self, action: #selector(storesTapped))
        barButtonItem.tintColor = UIColor(named: "Dark")
        return barButtonItem
    }()
    
    @objc func helpTapped() {
        print("Help Tapped")
        performSegue(withIdentifier: "itemToHelp", sender: nil)
    }
    
    
    @objc func loginTapped() {
        print("Login Tapped")
        performSegue(withIdentifier: "itemToLogin", sender: nil)
    }
    
    
    @objc func addItemsTapped() {
        print("Add Items Tapped")
        performSegue(withIdentifier: "itemToAddItem2", sender: nil)
        
    }
    
    @objc func storesTapped() {
        print("Stores Tapped")
        self.performSegue(withIdentifier: "unwindToStore", sender: nil)
        
        
    }
    
    
    @IBAction func unwindToItems(unwindSegue: UIStoryboardSegue) {
        print("unwind to Items")
    }
    
    
}
