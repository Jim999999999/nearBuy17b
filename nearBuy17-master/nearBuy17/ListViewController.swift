//
//  ListViewController.swift
//  nearBuy17
//
//  Created by James Miller on 12/4/21.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var createNewListButton: UIButton!
    @IBOutlet weak var reviewPendingListButton: UIButton!
    
    @IBOutlet weak var listTableView: UITableView!
    
     
    var dummyLists = ["Personal", "Work", "Family"]
    
    var createTitleText : String?
    var topButtonText : String?
    var lowerButtonText : String?
    var topButtonHidden : Bool?
    var lowerButtonHidden : Bool?
    var displayFieldText : String?
    
    var dummyMarkers = ["YellowP", "BlueW", "OrangeF"]
    var listCount = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        startupLists()
        listTableView.delegate = self
        listTableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func createNewListPressed(_ sender: UIButton) {
        createTitleText = "Create a List"
        topButtonText = "e-mail invitations to your list"
        lowerButtonText = "text invitations to your list"
        topButtonHidden = false
        lowerButtonHidden = false
        displayFieldText = "Enter a name for your list and invite others to join your list."
        performSegue(withIdentifier: "listToCreate", sender: nil)
    }
    
    @IBAction func reviewPendingListPressed(_ sender: UIButton) {
        createTitleText = "Review invitations"
        topButtonHidden = true
        lowerButtonHidden = true
        displayFieldText = "Placeholder text. Accept this list?"
        performSegue(withIdentifier: "listToCreate", sender: nil)
    }
    //MARK: - Table Views
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyLists.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listTableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath)
        cell.textLabel?.text = dummyLists[indexPath.row]
        
        
        if listCount == 0 {
            cell.imageView?.image = UIImage(named: "YellowP")
            listCount += 1
        } else if listCount == 1 {
            cell.imageView?.image = UIImage(named: "BlueW")
            listCount += 1
        } else {
            cell.imageView?.image = UIImage(named: "OrangeF")
        }

        

        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == "listToCreate" else {return}
        let destinationVC = segue.destination as! CreateListViewController
        
        destinationVC.createListTitleText = createTitleText
        destinationVC.topButtonText = topButtonText
        destinationVC.lowerButtonText = lowerButtonText
        destinationVC.topButtonHidden = topButtonHidden
        destinationVC.lowerButtonHidden = lowerButtonHidden
        destinationVC.displayText = displayFieldText
        
        }
    
    func startupLists()  {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.hidesBarsOnSwipe = true
        navigationItem.title = "Your Lists"
    
        navigationItem.leftBarButtonItems = [loginBarButtonItem, helpBarButtonItem]
        navigationItem.rightBarButtonItems = [itemsBarButtonItem, storesBarButtonItem]
        //listViewLabelText.text = "Press and hold your lists to edit and review who has access to this list"
    }
    
    @IBAction func unwindToList(unwindSegue: UIStoryboardSegue) {
        print("unwind to List")
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
        let barButtonItem = UIBarButtonItem(title: "Stores", style: .plain, target: self, action: #selector(storesTapped))
        barButtonItem.tintColor = UIColor(named: "Dark")
        return barButtonItem
    }()

    @objc func helpTapped() {
        print("Help Tapped")
        //performSegue(withIdentifier: "storeToHelp", sender: nil)
    }
    
    @objc func itemsTapped() {
        print("Items Tapped")
        performSegue(withIdentifier: "listToItems", sender: nil)
    }

    @objc func loginTapped() {
        print("Login Tapped")
        
        //self.performSegue(withIdentifier: "unwindToEnter", sender: nil)
        //performSegue(withIdentifier: "storeToLogIn", sender: nil)
    }
    
    @objc func storesTapped() {
        performSegue(withIdentifier: "listToStores", sender: nil)
        print("Stores Tapped")
    }


    
}
