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
                    if let hourly = self.parseJSON(safeData) {
                        
                        
                        
                        DispatchQueue.main.async {
                            let hourlyVC = SecondViewController()
                            hourlyVC.helpMe = hourlyVC.iveGotYouNow(hourly: hourly )
                            
                           
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ hourlyData: Data) -> HourlyArrayModel? {
        let decoder = JSONDecoder()
        do {
        let decodedData = try decoder.decode(HourlyData.self, from: hourlyData)
            var array: [HourlyModel] = []
            for item in decodedData.list {
                let hourly = HourlyModel(dt_txt: item.dt_txt, temp: item.main.temp, description: item.weather.description)
                array.append(hourly)
            }
            
            let arraySuccess = HourlyArrayModel(arr: array)
            return arraySuccess
        } catch {
            print(error)
            return nil
        }
    }
    
}


