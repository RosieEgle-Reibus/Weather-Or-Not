//
//  ViewController.swift
//  OnrampProject
//
//  Created by Giovanni Noa on 2/20/20.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, CurrentWeatherVMDelegate {
    
    
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    //connects ViewModel to ViewController
    
    var currentWeatherViewModel = CurrentWeatherViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Text field sends user entry/activity to VC
        searchTextField.delegate = self
        currentWeatherViewModel.delegate = self
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
        print(weather.temp)
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
}




//let hourlyVC = HourlyViewController()
//     self.present(hourlyVC, animated: true, completion: nil)
