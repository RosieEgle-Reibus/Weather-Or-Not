//
//  HourlyData.swift
//  OnrampProject
//
//  Created by Rose Egle on 3/3/20.
//

import Foundation


struct HourlyData: Codable {
    let list: [List]
}

struct List: Codable {
    let main: Main
    let weather: [Weather]
    struct Main: Codable {
        let temp: Double
    }
    struct Weather: Codable {
        let description: String
    }
    let dt_txt: String
}









