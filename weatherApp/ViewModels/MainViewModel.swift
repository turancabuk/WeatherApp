//
//  MainViewModel.swift
//  weatherApp
//
//  Created by Turan Çabuk on 18.11.2022.
//

import Foundation
import UIKit

/*class MainListViewModel {
    private var MainViewModels = [MainViewModel]()
    
    func addWeatherViewModel(_ vm: MainViewModel) {
     MainViewModels.append(vm)
     }
     func numberOfRows(_ section: Int) -> Int {
     return MainViewModels.count
     }
     func modelAt(_ index: Int) -> MainViewModel {
     return MainViewModels[index]
     }
}*/
final class MainViewModel {
    private let webService: WeatherWebServiceAdapter
    
    var weatherList = [Welcome]()
    
    ini
    
    func getNews(complrtionHandler: @escaping () -> Void) {
        webService.getNews { result in
            switch result {
            case .success(let response):
                if let articles = response.articles {
                    self.articleList = articles
                }
                complrtionHandler()
            case .failure(let error):
                print(error)
            }
        }
    }
}
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

