//
//  ViewController.swift
//  OnrampProject
//
//  Created by Giovanni Noa on 2/20/20.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, CurrentWeatherVMDelegate {
    
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var hourlyButton: UIButton!
    @IBOutlet weak var dailyButton: UIButton!
    @IBOutlet weak var conditionImageView: UIImageView!
    
    var conditionName: String?
    
    //connects ViewModel to ViewController
    var currentWeatherViewModel = CurrentWeatherViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hourlyButton.layer.cornerRadius = 4
        dailyButton.layer.cornerRadius = 4


        
        //Text field sends user entry/activity to VC
        searchTextField.delegate = self
        currentWeatherViewModel.delegate = self
        
        //sets city as the last city searched stored in defaults and displays data
        if let city = defaults.string(forKey: "CityNameDefault") {
            currentWeatherViewModel.fecthCurrentWeather(cityName: city)
        }
    }
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        
        //Dismiss keyboard after press
        searchTextField.endEditing(true)
    }
    
    //textField asks VC(delegate) if it should process pressing of Go Button
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    
    //triggered by endEditing method
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        //since text is an optional string uses if/let to unwrap and send over to VM for fetching
        if let city = searchTextField.text {
            currentWeatherViewModel.fecthCurrentWeather(cityName: city)
            
            //sets userdefault
            defaults.set( city, forKey: "CityNameDefault")
            
        }
        //resets textfield
        searchTextField.text = ""
    }
    
    //text field asks VC(delegate) if should end editing
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        //prompts if empty string, ends editing if string
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Please enter City"
            return false
        }
    }
    
    func didUpdateWeather(_ currentWeatherViewModel: CurrentWeatherViewModel, weather: CurrentWeatherModel ) {
        DispatchQueue.main.async {
            self.conditionName = weather.conditonName
            self.temperatureLabel.text = weather.tempString
            self.cityLabel.text = weather.cityName
            self.descriptionLabel.text = weather.description
            self.conditionImageView.image = UIImage(named: weather.conditonName)
            print(weather.conditonName)
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    
    @IBAction func hourlyButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToHourly", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToHourly" {
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.city = cityLabel.text
            destinationVC.conditionName = conditionName

        }
        if segue.identifier == "goToDaily" {
            let destinationVC = segue.destination as! ThirdViewController
            destinationVC.city = cityLabel.text
            destinationVC.conditionName = conditionName

        }
        
    }
    
    @IBAction func dailyButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToDaily", sender: self)
    }
    
    }
    

    

 



