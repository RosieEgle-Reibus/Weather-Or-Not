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
        print(url)
    }
    
}
