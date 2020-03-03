//
//  SecondViewController.swift
//  OnrampProject
//
//  Created by Rose Egle on 3/3/20.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var cityNameLabel: UILabel!
    
    var city: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityNameLabel.text = city
    }
    

    @IBAction func currentButtonPressed(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
    

}
