//
//  HourlyViewModel.swift
//  OnrampProject
//
//  Created by Rose Egle on 3/3/20.
//

//import Foundation
//
//struct HourlyViewModel {
//
//    let hourlyURL =  "https://api.openweathermap.org/data/2.5/forecast?appid=b3c709ce36ab49ac160b977a5e95fd14&units=imperial"
//
//    func fecthCurrentWeather(cityName: String) {
//        let url = "\(hourlyURL)&q=\(cityName)"
//        performRequest(with: url)
//    }
//
//    func performRequest(with urlString: String) {
//
//        if let url = URL(string: urlString) {
//            let session = URLSession(configuration: .default)
//
//            let task = session.dataTask(with: url) { (data, response, error) in
//                if error != nil {
//                    print(error!)
//                    return
//                }
//                if let safeData = data {
//                    if  let weather = self.parseJSON(safeData) {
//                        //Print things here
//                    }
//                }
//            }
//            task.resume()
//        }
//    }
//
//    func parseJSON(_ weatherData: Data) -> CurrentWeatherModel? {
//         let decoder = JSONDecoder()
//         do {
//         let decodedData = try decoder.decode(HourlyData.self, from: weatherData)
//
//             //get data from json and store
//             let name = decodedData.name
//             let temp = decodedData.main.temp
//             let description = decodedData.weather[0].description
//
//             //create weather object with weather model with data from json
//             let weather = CurrentWeatherModel(cityName: name, temp: temp, description: description)
//             return weather
//         } catch {
//             delegate?.didFailWithError(error: error)
//             return  nil
//         }
//     }
//
//}
