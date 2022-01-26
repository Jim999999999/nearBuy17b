//
//  HelpViewController.swift
//  nearBuy17
//
//  Created by Jim on 11/19/21.
//

import UIKit

class HelpViewController: UIViewController {

    
    
    @IBOutlet weak var helpPlaceholder: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startUpHelp()

        // Do any additional setup after loading the view.
    }
    

    
    func startUpHelp()  {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.hidesBarsOnSwipe = true
        navigationItem.title = "Using NearBuy"
        
        helpPlaceholder.text = "This space for rent"
        //navigationItem.leftBarButtonItems = [helpBarButtonItem, loginBarButtonItem]
        //navigationItem.rightBarButtonItems = [addItemsBarButtonItem, storesBarButtonItem]
        
    }

}
