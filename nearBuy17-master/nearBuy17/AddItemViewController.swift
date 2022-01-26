//
//  AddItemViewController.swift
//  nearBuy17
//
//  Created by Jim on 11/19/21.
//

import UIKit

class AddItemViewController: UIViewController {
    
    @IBOutlet weak var addNewItemTextField: UITextField!
    @IBOutlet weak var addBrandName: UITextField!
    
    @IBOutlet weak var addCategory: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startUpAddItem()

    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func startUpAddItem()  {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.hidesBarsOnSwipe = true
        navigationItem.title = "Add New Item"
        
        //navigationItem.leftBarButtonItems = [loginBarButtonItem, helpBarButtonItem]
        //navigationItem.rightBarButtonItems = [addItemsBarButtonItem, storesBarButtonItem]
        
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
        let barButtonItem = UIBarButtonItem(title: "Items", style: .plain, target: self, action: #selector(addItemsTapped))
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
        print("Items Tapped")
        performSegue(withIdentifier: "itemToAddItem", sender: nil)
        
    }
    
    @objc func storesTapped() {
        print("Stores Tapped")
        self.performSegue(withIdentifier: "unwindToStore", sender: nil)
        
        
    }
    
    
    
    
}
