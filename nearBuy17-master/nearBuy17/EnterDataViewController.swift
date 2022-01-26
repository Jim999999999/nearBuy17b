//
//  EnterDataViewController.swift
//  nearBuy17
//
//  Created by James Miller on 12/3/21.
//

import UIKit

class EnterDataViewController: UIViewController {

    var enterTitleText : String?
    var newAccount : Bool?
    
    @IBOutlet weak var emailEnteredText: UITextField!
    @IBOutlet weak var passwordEnteredText: UITextField!
    @IBOutlet weak var confirmPasswordText: UITextField!
    
    @IBOutlet weak var loginButtonText: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startUpEnter()
        

    }
    


    @IBAction func enterLoginInfoTapped(_ sender: UIButton) {
        print("Login button pressed")
        performSegue(withIdentifier: "EnterDataToList", sender: nil)
    }
    
    @IBAction func dataUseTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "dataUsageSegue", sender: nil)
    }
    

    
    func startUpEnter()  {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.hidesBarsOnSwipe = true
        navigationItem.title = enterTitleText ?? "Enter email and Password"
        
        //navigationItem.leftBarButtonItems = [helpBarButtonItem, loginBarButtonItem]
        //navigationItem.rightBarButtonItems = [addItemsBarButtonItem, storesBarButtonItem]
        
    }
    
    
    

    @IBAction func unwindToEnter(unwindSegue: UIStoryboardSegue) {
        print("unwind to Enter Data")
    }
    
}
