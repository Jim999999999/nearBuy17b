//
//  LogInViewController.swift
//  nearBuy17
//
//  Created by Jim on 11/19/21.
//

import UIKit

class LogInViewController: UIViewController {

    var carryoverText : String?
    var newAccount : Bool?
    
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startUpLogIn()
    
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        print("Login Tapped")
        carryoverText = "Login Pressed"
        
        performSegue(withIdentifier: "LoginToEnter", sender: nil)
    }
    
    @IBAction func appleLoginTapped(_ sender: UIButton) {
        print("Apple Login Tapped")
        carryoverText = "Apple Pressed"
        
        performSegue(withIdentifier: "LoginToEnter", sender: nil)
        
    }
    

    
    @IBAction func newUserTapped(_ sender: Any) {
        carryoverText = "Create an Account"
        performSegue(withIdentifier: "LoginToEnter", sender: nil)
    }
    

    

    
    
    func startUpLogIn()  {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.hidesBarsOnSwipe = true
        navigationItem.title = "Welcome"
        
        //navigationItem.leftBarButtonItems = [helpBarButtonItem, loginBarButtonItem]
        //navigationItem.rightBarButtonItems = [addItemsBarButtonItem, storesBarButtonItem]
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == "LoginToEnter" else {return}
        let destinationVC = segue.destination as! EnterDataViewController
        
        destinationVC.enterTitleText = carryoverText
      
        
        }
        
    @IBAction func unwindToLogIn(unwindSegue: UIStoryboardSegue) {
        print("unwind segue")
    }
    
}


