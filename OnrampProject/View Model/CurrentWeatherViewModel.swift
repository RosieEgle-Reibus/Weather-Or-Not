//
//  CurrentWeatherViewModel.swift
//  OnrampProject
//
//  Created by Rose Egle on 3/2/20.
//

import Foundation

struct CurrentWeatherViewModel {
    
    let currentWeatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=b3c709ce36ab49ac160b977a5e95fd14&units=imperial"
    
    func fecthCurrentWeather(cityName: String) {
        let url = "\(currentWeatherURL)&q=\(cityName)"
        performRequest(urlString: url)
    }
    
    func performRequest(urlString: String) {
        
        //create optional URL String
        if let url = URL(string: urlString) {
            
            //session is an object that coordinates group of related network data-transfer tasks
            let session = URLSession(configuration: .default)
            
            //task calls closure completion handler when it is done retrieving data
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    //turn data into string
                    let dataString = String(data: safeData, encoding: .utf8)
                    print(dataString)
                }
            }
            
            //default is to begin in suspended state, resume starts the task
            task.resume()
        }
    }
    
   
    
}
