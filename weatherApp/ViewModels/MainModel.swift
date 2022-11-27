//
//  WeatherModel.swift
//  weatherApp
//  Created by Turan Çabuk on 17.11.2022.

import Foundation

// MARK: - Welcome
struct WeatherModel {
    let countryName: String
    let cityName: String
    let description: String
    let conditionId: Int
    let humidity: Float
    let temperature: Float
    let minTemp: Float
    let maxTemp: Float
    
    init (data: WeatherData) {
        
        self.countryName = data.sys.country
        self.cityName = data.name
        self.description = data.weather[0].description
        self.conditionId = data.weather[0].id
        self.humidity = data.main.humidity
        self.temperature = data.main.temp
        self.minTemp = data.main.temp_min
        self.maxTemp = data.main.temp_max
        
    }
    
    
    var temperatureString: String {
        return String(format: "%.0f", temperature)
    }
    var minTempString: String {
        return String(format: "%.0f", minTemp)
    }
    var maxTempString: String {
        return String(format: "%.0f", maxTemp)
    }
    var humidityString: String {
        return String(format: "%.0f", humidity)
    }
    
    var conditionName: String {
        switch conditionId {
        case 655...699:
            return "snowy"
        case 700...781:
            return "rainy"
        case 782...801:
            return "cloudy"
        case 802...805:
            return "sunny"
        default:
            return ""

        }
    }
    
}
