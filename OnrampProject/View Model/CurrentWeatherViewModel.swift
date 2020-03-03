//
//  CurrentWeatherViewModel.swift
//  OnrampProject
//
//  Created by Rose Egle on 3/2/20.
//

import Foundation

protocol CurrentWeatherVMDelegate {
    func didUpdateWeather(_ currentWeatherViewModel: CurrentWeatherViewModel, weather: CurrentWeatherModel)
    func didFailWithError(error: Error)
}

struct CurrentWeatherViewModel {
    
    let currentWeatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=b3c709ce36ab49ac160b977a5e95fd14&units=imperial"
    
    var delegate: CurrentWeatherVMDelegate?
    
    func fecthCurrentWeather(cityName: String) {
        let url = "\(currentWeatherURL)&q=\(cityName)"
        performRequest(with: url)
    }
    
    func performRequest(with urlString: String) {
        
        //create optional URL String
        if let url = URL(string: urlString) {
            
            //session is an object that coordinates group of related network data-transfer tasks
            let session = URLSession(configuration: .default)
            
            //task calls closure completion handler when it is done retrieving data
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                self.delegate?.didFailWithError(error: error! )
                    return
                }
                if let safeData = data {
                    if  let weather = self.parseJSON(safeData) {
                        
                        //call upon the delegate and tell it to run update function
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            
            //default is to begin in suspended state, resume starts the task
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data) -> CurrentWeatherModel? {
        let decoder = JSONDecoder()
        
        //in case throws error added catch
        do {
        let decodedData = try decoder.decode(CurrentWeatherData.self, from: weatherData)
            
            //get data from json and store
            let name = decodedData.name
            let temp = decodedData.main.temp
            let description = decodedData.weather[0].description
            
            //create weather object with weather model with data from json
            let weather = CurrentWeatherModel(cityName: name, temp: temp, description: description)
            return weather
        } catch {
            delegate?.didFailWithError(error: error)
            return  nil
        }
    }
   
    
}
 
