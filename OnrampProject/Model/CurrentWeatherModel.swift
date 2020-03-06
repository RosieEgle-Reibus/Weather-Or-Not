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
    let id: Int
    
    
    var tempString: String {
        return String(format: "%.0f", temp)
    }
    
    var conditonName: String {
        switch id {
        case 200...232:
            return "thunder"
        case 300...531:
            return "rain"
        case 600...622:
            return "snow"
        case 701...781:
            return "cloudy"
        case 800:
            return "sunny"
        case 801...802:
            return "cloudy"
        default:
            return "sunny"
        }
    }
    
    
}


