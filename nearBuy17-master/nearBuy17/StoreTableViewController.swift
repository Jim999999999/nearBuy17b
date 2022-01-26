//
//  StoreTableViewController.swift
//  nearBuy17
//
//  Created by Jim on 11/19/21.
//

import UIKit
import CoreData

class StoreTableViewController: UITableViewController {

    
    var storeArray = ["Target", "Walmart", "Trader Joe's", "Whole Foods"]
    var selectedStore : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startupStores()

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return storeArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "storeCell", for: indexPath)
        
        cell.textLabel?.text = storeArray[indexPath.row] //.storeName

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "storeToShopping", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == "storeToShopping" else {return}
        let destinationVC = segue.destination as! ShoppingTableViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedStore = storeArray[indexPath.row]
        }
        
    }
    
    func addNewStore() {
        var storeTextField = UITextField()
        let alert = UIAlertController(title: "Add New Store", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            //
            let newStore = storeTextField.text!
            self.storeArray.append(newStore)
            //
            
//            let newStore = Store(context: self.context)
//            newStore.storeName = storeTextField.text!
//            self.storeArray.append(newStore)
//            self.saveStores()
            
            self.tableView.reloadData()
        }
        let cancel=UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(action)
        alert.addAction(cancel)
        
        alert.addTextField { (field) in
            storeTextField = field
            storeTextField.placeholder = "Add New Store"
        }
        present(alert, animated: true, completion: nil)
        
        
    }

    
    
//MARK: - Startup Format and Bar Button Items
    
    func startupStores()  {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.hidesBarsOnSwipe = true
        navigationItem.title = "Stores"
    
        navigationItem.leftBarButtonItems = [loginBarButtonItem, helpBarButtonItem]
        navigationItem.rightBarButtonItems = [itemsBarButtonItem, storesBarButtonItem]
        
        
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
        
    lazy var itemsBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(title: "Items", style: .plain, target: self, action: #selector(itemsTapped))
        barButtonItem.tintColor = UIColor(named: "Dark")
        return barButtonItem
    }()
    
    lazy var storesBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(title: "+Store", style: .plain, target: self, action: #selector(storesTapped))
        barButtonItem.tintColor = UIColor(named: "Dark")
        return barButtonItem
    }()

    @objc func helpTapped() {
        print("Help Tapped")
        performSegue(withIdentifier: "storeToHelp", sender: nil)
    }
    
    @objc func itemsTapped() {
        print("Items Tapped")
        performSegue(withIdentifier: "storeToItem", sender: nil)
    }

    @objc func loginTapped() {
        print("Login Tapped")
        performSegue(withIdentifier: "storeToLogIn", sender: nil)
    }
    
    @objc func storesTapped() {
        print("+ Stores Tapped")
        addNewStore()
        
    }

    @IBAction func unwindToStore(unwindSegue: UIStoryboardSegue) {
        print("unwind to Store")
    }
    
}
