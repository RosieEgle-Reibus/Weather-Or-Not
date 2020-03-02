//
//  ViewController.swift
//  OnrampProject
//
//  Created by Giovanni Noa on 2/20/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }


    @IBAction func searchButtonPressed(_ sender: UIButton) {
        
        let hourlyVC = HourlyViewController()
        self.present(hourlyVC, animated: true, completion: nil)
    }
}

