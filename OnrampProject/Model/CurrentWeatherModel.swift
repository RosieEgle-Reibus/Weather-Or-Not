//
//  CurrentWeatherModel.swift
//  OnrampProject
//
//  Created by Rose Egle on 3/2/20.
//

import Foundation

struct CurrentWeatherModel {
    let  cityName: String
    let temp: Double
    let description: String
    
    var tempString: String {
        return String(format: "%.0f", temp)
    }
}
