//
//  WeatherManager.swift
//  weatherApp
//  Created by Turan Çabuk on 18.11.2022.

import Foundation



protocol WeatherManagerDelegate {
    func updateWeather(_ WeatherManager: WeatherManager, weather: WeatherModel)
    func failError(error: Error)
}
struct WeatherManager {
    
    var delegate: WeatherManagerDelegate?
    let APIUrl = "https://api.openweathermap.org/data/2.5/weather"
    
    func weatherByTextField(cityName: String) {
        guard let url  = URL(string: APIUrl) else { return }
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        
        components?.queryItems = [URLQueryItem(name: "q", value: cityName.lowercased()),URLQueryItem(name:"appid", value: "c7e855dea4a4c52c2f1d97501e6be4fb"), URLQueryItem(name: "units", value: "metric")]
        guard let url = components?.url else { return }
        request(with: url)
    }
    
    func request(with url: URL) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.failError(error: error!)
                    return
                }
                if let safeData = data {
                    if let finalDataWeather = self.parseJson(safeData) {
                        self.delegate?.updateWeather(self, weather: finalDataWeather)
                    }
                }
            }
            task.resume()
    }
    func parseJson(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let weather = WeatherModel(data: decodedData)
                return weather
        } catch {
            delegate?.failError(error: error)
            return nil
        }
    }
    
}



































