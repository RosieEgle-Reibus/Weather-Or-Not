//
//  HourlyViewController.swift
//  OnrampProject
//
//  Created by Rose Egle on 3/2/20.
//

import UIKit

class HourlyViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        let label = UILabel()
        label.text = "Hello"
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        view.addSubview(label)
    }
}
