//
//  WeatherWebService.swift
//  weatherApp
//  Created by Turan Çabuk on 18.11.2022.

import Foundation

protocol WeatherWebServiceProtocol {
    func fetch<T: Codable>(response: T.Type, with path: WeatherAPICall, completion: @escaping (Result<T, Error>) -> Void)
}
final class WeatherWebService {
    func fetch<T: Codable>(response: T.Type, with path: WeatherAPICall, completion: @escaping (Result<T, Error>) -> Void) {
        let urlRequest = URLRequest(url: path.url)
        let task = URLSession.shared.dataTask(with: urlRequest) {data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NetworkError.dataNotFound))
                return
            }
            let decoder = JSONDecoder()
            do {
                let response = try decoder.decode(T.self, from: data)
                completion(.success(response))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
protocol WeatherWebServiceAdapterProtocol {
    func getWeather(completion: @escaping (Result<Welcome, Error>) -> Void)
}

final class WeatherWebServiceAdapter: WeatherWebServiceAdapterProtocol {
    private let webService: WeatherWebServiceProtocol
    
    init(webService: WeatherWebServiceProtocol) {
        self.webService = webService
    }
    
    func getWeather(completion: @escaping (Result<Welcome, Error>) -> Void) {
        webService.fetch(response: Welcome.self, with: .getWeather , completion: completion)
    }
}

enum NetworkError: Error {
    case dataNotFound
}

