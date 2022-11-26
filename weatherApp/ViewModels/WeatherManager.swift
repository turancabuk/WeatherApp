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
    let APIUrl = "https://api.openweathermap.org/data/2.5/weather?appid=c7e855dea4a4c52c2f1d97501e6be4fb&units=metric"
    
    func weatherByTextField(cityName: String) {
        let urlString = "\(APIUrl)&q=\(cityName)"
        request(with: urlString)
    }
    
    func request(with urlString: String) {
        if let url = URL(string: urlString) {
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
    }
    func parseJson(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let maxTemp = decodedData.main.temp_max
            let minTemp = decodedData.main.temp_min
            let humidity = decodedData.main.humidity
            let countryName = decodedData.sys.country
            let cityName = decodedData.name
            let description = decodedData.weather[0].description
            
           let weather = WeatherModel(countryName: countryName, cityName: cityName, description: description, conditionId: id, humidity: humidity, temperature: temp, minTemp: minTemp, maxTemp: maxTemp)
                
                return weather
                
        } catch {
            delegate?.failError(error: error)
            return nil
        }
    }
    
}



































//protocol WeatherWebServiceProtocol {
//    func fetch<T: Codable>(response: T.Type, with path: WeatherAPICall, completion: @escaping (Result<T, Error>) -> Void)
//}
//final class WeatherWebService {
//    func fetch<T: Codable>(response: T.Type, with path: WeatherAPICall, completion: @escaping (Result<T, Error>) -> Void) {
//        let urlRequest = URLRequest(url: path.url)
//        let task = URLSession.shared.dataTask(with: urlRequest) {data, _, error in
//            if let error = error {
//                completion(.failure(error))
//                return
//            }
//            guard let data = data else {
//                completion(.failure(NetworkError.dataNotFound))
//                return
//            }
//            let decoder = JSONDecoder()
//            do {
//                let response = try decoder.decode(T.self, from: data)
//                completion(.success(response))
//            } catch {
//                completion(.failure(error))
//            }
//        }
//        task.resume()
//    }
//}
////protocol WeatherWebServiceAdapterProtocol {
////    func getWeather(completion: @escaping (Result<Welcome, Error>) -> Void)
////}
////
////final class WeatherWebServiceAdapter: WeatherWebServiceAdapterProtocol {
////    private let webService: WeatherWebServiceProtocol
////
////    init(webService: WeatherWebServiceProtocol) {
////        self.webService = webService
////    }
////
////    func getWeather(completion: @escaping (Result<Welcome, Error>) -> Void) {
////        webService.fetch(response: Welcome.self, with: .getWeather , completion: completion)
////    }
////}
////
//enum NetworkError: Error {
//    case dataNotFound
//}
//
