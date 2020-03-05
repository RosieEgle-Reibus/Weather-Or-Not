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
        HourlyModel(dt_txt: "3PM", temp: 63.45, description: "light clouds"),
        HourlyModel(dt_txt: "6PM", temp: 63.88, description: "light rain"),
        HourlyModel(dt_txt: "9PM", temp: 62.33, description: "light wind"),
        HourlyModel(dt_txt: "12AM", temp: 62.33, description: "light wind"),
        HourlyModel(dt_txt: "3AM", temp: 63.55, description: "light rain"),
        HourlyModel(dt_txt: "6AM", temp: 63.53, description: "light rain"),
        HourlyModel(dt_txt: "9AM", temp: 63.55, description: "light clouds"),
        HourlyModel(dt_txt: "12PM", temp: 65.00, description: "light clouds"),
        HourlyModel(dt_txt: "3PM", temp: 66.55, description: "light clouds")
    ]
    
    var hourlyViewModel = HourlyViewModel()
    
    var helpMe: [HourlyModel] = []
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityNameLabel.text = city
        hourlyViewModel.fecthHourlyWeather(cityName: city!)
        tableView.dataSource = self
        tableView.register(UINib(nibName: "HourlyCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
    
    }
    


    @IBAction func currentButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        
    }
    

    
    func iveGotYouNow(hourly: HourlyArrayModel) -> [HourlyModel] {
//        print(hourly.arr[0].dt_txt)
            self.helpMe = hourly.arr
//            print(hourly.arr[0].dt_txt)
//            print(helpMe)
         
        return hourly.arr
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
            cell.tempLabel.text = hourlyArray[indexPath.row].tempString
           return cell
        }
}



