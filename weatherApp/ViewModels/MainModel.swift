//
//  WeatherModel.swift
//  weatherApp
//
//  Created by Turan Çabuk on 17.11.2022.

import Foundation

// MARK: - Welcome
struct WeatherModel: Codable {
    let countryName: String
    let cityName: String
    let description: String
    let conditionId: Int
    let humidity: Float
    let temperature: Float
    let minTemp: Float
    let maxTemp: Float
    
    
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
        case 1...800:
            return "sun.png"
        default:
            return ""
        
        }
    }
}
    
