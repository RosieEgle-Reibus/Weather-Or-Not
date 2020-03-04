//
//  HourlyModel.swift
//  OnrampProject
//
//  Created by Rose Egle on 3/3/20.
//

import Foundation

struct HourlyModel {
    let dt_txt: String
    let temp: Double
    let description: String
    
    var tempString: String {
        return String(format: "%.0f", temp)
    }
}
