//
//  AddItem2ViewController.swift
//  nearBuy17
//
//  Created by Jim on 1/21/22.
//

import UIKit

class AddItem2ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    

    @IBOutlet weak var addNewItemNameTextField: UITextField!
    @IBOutlet weak var addNewItemBrandTextField: UITextField!
    
    @IBOutlet weak var selectNewItemCategory: UIButton!
    @IBOutlet weak var selectNewItemList: UIButton!
    
    @IBOutlet weak var addStoresTableView: UITableView!
    
    var itemArray = ["Apples", "Bananas", "Corn", "Dog Food"]
    var brandArray = ["none", "none", "DelMonte", "Alpo"]
    var storeArray = ["Target", "Walmart", "Trader Joe's", "Whole Foods"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startUpAddItem()
        addStoresTableView.delegate = self
        addStoresTableView.dataSource = self
        addStoresTableView.allowsMultipleSelection = true
        addStoresTableView.allowsMultipleSelectionDuringEditing = true

        // Do any additional setup after loading the view.
    }
    
    @IBAction func selectCategoryPressed(_ sender: Any) {
    }
    
    @IBAction func selectListPressed(_ sender: UIButton) {
    }
        
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func cameraButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        addNewItem()
        clearCells()
        
    }
    
    func addNewItem() {
        let newItem = addNewItemNameTextField.text!
        self.itemArray.append(newItem)
        
        let newBrand = addNewItemBrandTextField.text!
        self.brandArray.append(newBrand)

        
    }
    
    //to be used once DB is running
//    func addNewItem(addStores: Array<Store>) {
//        let newItem = Item(context: self.context)
//        newItem.itemName = addNewItemNameTextField.text ?? ""
//        newItem.itemBrand = addNewItemBrandTextField.text ?? ""
//        newItem.needed = true
//        newItem.list = NSMutableSet(array: addList)
//        newItem.stores = NSMutableSet(array: addStores)
//        self.itemArray?.append(newItem)
//        self.saveItem()
//    }
    
    func clearCells() {
        addNewItemNameTextField.text = ""
        addNewItemBrandTextField.text = ""
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storeArray.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = addStoresTableView.dequeueReusableCell(withIdentifier: "addNewItemCell") as UITableViewCell?
        //let cell = addStoresTableView.dequeueReusableCell(withIdentifier: "addNewItemCell", for indexPath) as? UITableViewCell
        
        cell?.textLabel?.text = self.storeArray[indexPath.row] //.storeName
        
        return cell!
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

}
