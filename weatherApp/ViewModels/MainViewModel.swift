//
//  MainViewModel.swift
//  weatherApp
//
//  Created by Turan Çabuk on 18.11.2022.
//

import Foundation










class MainViewModel {
    let weather: Welcome
    
    init(weather: Welcome) {
        self.weather = weather
    }
    var city: String {
        return weather.name!
    }
    var temperature: Double {
        return weather.main!.temp!
    }
    var visibility: Int {
        return weather.visibility!
    }
    var seaLevel: Int {
        return weather.main!.seaLevel!
    }
    var humidity: Int {
        return weather.main!.humidity!
    }
    var pressure: Int {
        return weather.main!.pressure!
    }
    var weatherId: Int {
        return weather.id!
    }
    
    
    
    
}
