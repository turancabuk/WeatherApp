//
//  Constant.swift
//  weatherApp
//  Created by Turan Çabuk on 17.11.2022.
//  API CALL: http://api.openweathermap.org/data/2.5/forecast?id=524901&appid=
//  Geocoding:  http://api.openweathermap.org/geo/1.0/direct?q={city name}&appid={API key}
//  API KEY: c7e855dea4a4c52c2f1d97501e6be4fb

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
