//
//  ThirdViewController.swift
//  OnrampProject
//
//  Created by Rose Egle on 3/5/20.
//

import UIKit

class ThirdViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var currentButton: UIButton!
    
    var city: String?
    
    var dailyForcast = [
        DailyModel(dt_txt: "Monday", temp: 55.33, description: "Light Clouds"),
        DailyModel(dt_txt: "Tuesday", temp: 55.33, description: "Light Clouds"),
        DailyModel(dt_txt: "Wednesday", temp: 55.33, description: "Light Clouds"),
        DailyModel(dt_txt: "Thursday", temp: 55.33, description: "Light Clouds"),
        DailyModel(dt_txt: "Friday", temp: 55.33, description: "Light Clouds") 
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentButton.layer.cornerRadius = 4
        tableView.dataSource = self
        tableView.register(UINib(nibName: "DailyCell", bundle: nil), forCellReuseIdentifier: "DailyCell" )
    }
    
    
    
    @IBAction func returnToCurrentPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil  )
        
    }
    
}

extension ThirdViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DailyCell" , for: indexPath) as! DailyCell
        cell.dayLabel.text = dailyForcast[indexPath.row].dt_txt
        cell.descriptionLabel.text = dailyForcast[indexPath.row].description
        cell.tempLabel.text = dailyForcast[indexPath.row].tempString
        return cell
    }

}

