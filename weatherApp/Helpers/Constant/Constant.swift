//
//  Constant.swift
//  weatherApp
//  Created by Turan Çabuk on 17.11.2022.
//  API CALL:   https://api.openweathermap.org/data/2.5/weather?q=\(city.escaped())
//  API KEY:    &appid=c7e855dea4a4c52c2f1d97501e6be4fb

import Foundation

enum WeatherAPICall: String {
    private var baseUrl: String {
        "https://api.openweathermap.org/data/2.5/weather?q=ankara"
    }
    
    private var apiKey: String {
        "&appid=c7e855dea4a4c52c2f1d97501e6be4fb"
    }
    
    
    
    case getWeather
    
    private var urlString: String {
        switch self {
        case .getWeather:
            return "\(baseUrl)\(apiKey)"
        }
    }
    
    var url: URL {
        switch self {
        case .getWeather:
            return URL(string: urlString)!
        }
    }
}
