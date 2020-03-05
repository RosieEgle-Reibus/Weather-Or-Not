//
//  SecondViewController.swift
//  OnrampProject
//
//  Created by Rose Egle on 3/3/20.
//

import UIKit

class SecondViewController: UIViewController, HourlyVMDelegate {


    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var city: String?
    var hourlyArray: [HourlyModel] = [
        HourlyModel(dt_txt: "Paris", temp: 65.44, description: "light clouds"),
        HourlyModel(dt_txt: "Toronto", temp: 63.55, description: "light rain"),
        HourlyModel(dt_txt: "Atlanta", temp: 62.33, description: "light wind")
    ]
    
    var hourlyViewModel = HourlyViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityNameLabel.text = city
        tableView.dataSource = self
        tableView.register(UINib(nibName: "HourlyCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        hourlyViewModel.fecthHourlyWeather(cityName: city!)
        hourlyViewModel.delegate = self
    }
    

    @IBAction func currentButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func didUpdateHourly(hourlyViewModel:  HourlyViewModel, hourly: HourlyArrayModel) {
        print(hourly)
        print(hourly.arr[0].dt_txt)
    }
    
}

extension SecondViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return hourlyArray.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! HourlyCell
            cell.hourLabel.text = hourlyArray[indexPath.row].dt_txt
            cell.descriptionLabel.text = hourlyArray[indexPath.row].description
           return cell
        }
}



