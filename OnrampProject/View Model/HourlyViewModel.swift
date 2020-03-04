//
//  HourlyViewModel.swift
//  OnrampProject
//
//  Created by Rose Egle on 3/3/20.
//

import Foundation

struct HourlyViewModel {

    let hourlyURL =  "https://api.openweathermap.org/data/2.5/forecast?appid=b3c709ce36ab49ac160b977a5e95fd14&units=imperial"

    
   func fecthHourlyWeather(cityName: String) {
        let urlString = "\(hourlyURL)&q=\(cityName)"
        preformRequest(urlString: urlString)
    }
  
    func preformRequest(urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
                let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    return
                }
                if let safeData = data {
                    self.parseJSON(hourlyData: safeData)
                }
            }
            task.resume()
        }
    }
    
  
func parseJSON(hourlyData: Data) -> [List]? {
       let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(HourlyData.self, from: hourlyData)
            print(decodedData.list.count)
            let hourlyArray = decodedData.list
           return hourlyArray
            } catch {
            print(error)
            return nil
    }
        
    }

  

}
