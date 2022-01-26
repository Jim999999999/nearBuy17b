//
//  ShoppingTableViewController.swift
//  nearBuy17
//
//  Created by Jim on 11/19/21.
//

import UIKit
import CoreData

class ShoppingTableViewController: UITableViewController {

    //var shoppingArray = [Item]()
    var shoppingArray = ["Cheese", "fish", "Toilet Paper", "Tacos", "Booze"]
    var selectedStore : String?
    var purchaseArray : [String?] = []
    var selected : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startupShopping()
        
           
        
        
       
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return shoppingArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingCell", for: indexPath)
        cell.textLabel?.text = shoppingArray[indexPath.row] //.itemName
        cell.accessoryType = .checkmark
        cell.imageView?.image = UIImage(named: "BlueW")
        
        return cell
    }
    
    // Select Row
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //shoppingArray[indexPath.row].needed = !shoppingArray[indexPath.row].needed
        purchaseArray.append(shoppingArray[indexPath.row])
        
    }
    
    // DEselect Row
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        //purchaseArray.remove(at: indexPath.row)
        let selected = shoppingArray[indexPath.row]
        print(selected)
    
    }
    
    func buyButtonPressed() {
        
    }
    
    
    
    

    //MARK: - Startup and Navigation
        
        func startupShopping()  {
            navigationController?.navigationBar.prefersLargeTitles = true
            navigationController?.hidesBarsOnSwipe = true
            navigationItem.title = selectedStore
            
            
            navigationItem.leftBarButtonItems = [buyBarButtonItem, helpBarButtonItem]
            navigationItem.rightBarButtonItems = [itemsBarButtonItem, storesBarButtonItem]
        }
    
        lazy var helpBarButtonItem: UIBarButtonItem = {
            let barButtonItem = UIBarButtonItem(title: "Help", style: .plain, target: self, action: #selector(helpTapped))
            barButtonItem.tintColor = UIColor(named: "Dark")
            return barButtonItem
        }()
        
        lazy var buyBarButtonItem: UIBarButtonItem = {
            let barButtonItem = UIBarButtonItem(title: "BUY", style: .plain, target: self, action: #selector(buyTapped))
            barButtonItem.tintColor = UIColor.red
            return barButtonItem
        }()
                    
        lazy var itemsBarButtonItem: UIBarButtonItem = {
            let barButtonItem = UIBarButtonItem(title: "Items", style: .plain, target: self, action: #selector(itemsTapped))
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
            performSegue(withIdentifier: "shoppingToHelp", sender: nil)
        }

        @objc func buyTapped() {
            print("BUY! Tapped")
        }
        
        @objc func itemsTapped() {
            print("Items Tapped")
            performSegue(withIdentifier: "shoppingToItem", sender: nil)
        }
        
        @objc func storesTapped() {
            print("unwind to Stores Tapped")
            self.performSegue(withIdentifier: "unwindShoppingToStore", sender: nil)
        }

    
    
}
