//
//  Constant.swift
//  weatherApp
//
//  Created by Turan Çabuk on 17.11.2022.
//  API CALL: api.openweathermap.org/data/2.5/forecast/daily?lat={lat}&lon={lon}&cnt={cnt}&appid={API key}
//  API KEY: c900250dc8d0d3e0595d2fd0f3e9de44

import Foundation

enum WeatherAPICall: String {
    private var baseUrl: String {
        "api.openweathermap.org/data/2.5/forecast/daily?"
    }
    private var latlong: String {
        "lat={lat}&lon={lon}&cnt={cnt}"
    }
    private var APIKey: Any {
        "appid={API key}"
    }
    
    case getWeather
    
    private var urlString: String {
        switch self {
        case.getWeather:
            return "\(baseUrl)\(latlong)&\(APIKey)"
        }
    }
    var url: URL {
        switch self {
        case.getWeather:
            return URL(string: urlString)!
        }
    }
}
