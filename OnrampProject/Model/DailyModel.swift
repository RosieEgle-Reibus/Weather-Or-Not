//
//  File.swift
//  OnrampProject
//
//  Created by Rose Egle on 3/5/20.
//

import Foundation

struct DailyModel {
    let dt_txt: String
    let temp: Double
    let description: String
    
    var tempString: String {
        return String(format: "%.0f", temp)
    }
}
