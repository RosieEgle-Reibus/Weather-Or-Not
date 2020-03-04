//
//  HourlyData.swift
//  OnrampProject
//
//  Created by Rose Egle on 3/3/20.
//

import Foundation

struct HourlyData {
    let temp: Double
    let time: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case list = "list"
        case main = "main"
        case temp = "temp"
        case weather = "weather"
        case description = "description"
        case dt_txt = "dt_txt"
    }
    
}

extension HourlyData: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
    }
}










//struct HourlyData: Codable {
//    let list: [List]
//
//}
//
//struct List: Codable {
//    let dt: Int
//    let dt_txt: String
//}


