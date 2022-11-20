//
//  Constant.swift
//  weatherApp
//  Created by Turan Çabuk on 17.11.2022.
//  API CALL:   https://api.openweathermap.org/data/2.5/weather?q=\(city.escaped())
//  API KEY:    &appid=c7e855dea4a4c52c2f1d97501e6be4fb

import Foundation

class WeatherByCity {

    static func urlForWeather(city: String) -> URL {
        var baseUrl: String {
            "https://api.openweathermap.org/data/2.5/weather?q=ankara"
        }
        var APIKey: Any {
            "&appid=c7e855dea4a4c52c2f1d97501e6be4fb"
        }
        
        
  
        return URL(string:
                    "\(baseUrl)\(APIKey)")!
        
        
    }
}
