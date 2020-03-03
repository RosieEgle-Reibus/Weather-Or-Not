//
//  CurrentWeatherData.swift
//  OnrampProject
//
//  Created by Rose Egle on 3/2/20.
//

import Foundation


//conforms to Codable protocol for json rendering/parsing purposes
struct CurrentWeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let main: String
    let description: String
}
