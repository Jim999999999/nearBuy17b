//
//  CreateListViewController.swift
//  nearBuy17
//
//  Created by James Miller on 12/4/21.
//

import UIKit
import CoreLocation

class CreateListViewController: UIViewController {

    var createListTitleText : String?
    var topButtonText : String?
    var lowerButtonText : String?
    var listName = "  "
    var topButtonHidden : Bool?
    var lowerButtonHidden : Bool?
    var displayText : String?
    
    @IBOutlet weak var addListButton: UIButton!
    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var lowerButton: UIButton!
    
    @IBOutlet weak var listNameTextField: UITextField!
    @IBOutlet weak var circularTextField: UITextField!
    
    @IBOutlet weak var displayLabelText: UILabel!
    
    //@IBOutlet weak var practiceLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startupCreate()
        roundTextField()
        //practiceLabel.text = listNameTextField.text


        // Do any additional setup after loading the view.
    }
    


    
    
    @IBAction func colorPressed(_ sender: UIButton) {
        circularTextField.backgroundColor = sender.tintColor
        if sender.tintColor == .cyan || sender.tintColor == .yellow {
            circularTextField.textColor = .black
        } else {
            circularTextField.textColor = .white
        }
        let initials = listNameTextField.text
        circularTextField.text = String(initials!.prefix(2))
        //practiceLabel.backgroundColor = sender.tintColor
    
        
    }
    
    
    @IBAction func refreshEcho(_ sender: UITextField) {
        circularTextField.text = sender.text
        //practiceLabel.text = sender.text
    }
        
    
    @IBAction func topButtonPressed(_ sender: UIButton) {
        print("Top Button Pressed")
    }
    
    
    @IBAction func lowerButtonPressed(_ sender: UIButton) {
        print("Lower Button Pressed")
    }
    
    
    
    
    
    
 
    func roundTextField() {
        circularTextField.layer.cornerRadius = 75
        circularTextField.layer.masksToBounds = true
        circularTextField.backgroundColor = UIColor(named: "Dark")
    }
    

    func startupCreate()  {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.hidesBarsOnSwipe = true
        navigationItem.title = createListTitleText
        displayLabelText.text = displayText
        topButton.isHidden = topButtonHidden ?? true
        lowerButton.isHidden = lowerButtonHidden ?? true
        topButton.setTitle(topButtonText, for: .normal)
        lowerButton.setTitle(lowerButtonText, for: .normal)
    }
    
    @IBAction func addListPressed(_ sender: Any) {
        print("Add List Pressed")
        self.performSegue(withIdentifier: "unwindToList", sender: nil)
    }
}
