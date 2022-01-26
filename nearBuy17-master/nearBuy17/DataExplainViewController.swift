//
//  DataExplainViewController.swift
//  nearBuy17
//
//  Created by James Miller on 12/3/21.
//

import UIKit

class DataExplainViewController: UIViewController {

    @IBOutlet weak var dataPlaceholder: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startupData()
        dataPlaceholder.text = "Here be monsters!"
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func startupData()  {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.hidesBarsOnSwipe = true
        navigationItem.title = "How will my data be used?"
        
    }
    
   
}
