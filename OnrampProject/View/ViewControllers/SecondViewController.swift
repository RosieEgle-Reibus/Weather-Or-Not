//
//  SecondViewController.swift
//  OnrampProject
//
//  Created by Rose Egle on 3/3/20.
//

import UIKit

class SecondViewController: UIViewController {


    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var city: String?
    var hourlyArray: [HourlyModel] = [
        HourlyModel(cityName: "Paris", temp: 65.44, description: "light clouds"),
        HourlyModel(cityName: "Toronto", temp: 63.55, description: "light rain"),
        HourlyModel(cityName: "Atlanta", temp: 62.33, description: "light wind") 
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityNameLabel.text = city
        tableView.dataSource = self
        tableView.register(UINib(nibName: "HourlyCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
    }
    

    @IBAction func currentButtonPressed(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension SecondViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return hourlyArray.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! HourlyCell
            cell.descriptionLabel.text = hourlyArray[indexPath.row].description
           return cell
        }
}

