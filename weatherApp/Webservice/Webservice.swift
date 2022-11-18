//
//  WeatherWebService.swift
//  weatherApp
//  Created by Turan Çabuk on 18.11.2022.

import Foundation

protocol WeatherWebServiceProtocol {
    func fetch<T: Codable>(response: T.Type, with path: String, completion: @escaping (Result<T, Error>) -> Void)
}
final class WeatherWebService {
    func fetch<T: Codable>(response: T.Type, with path: String, completion: @escaping (Result<T, Error>) -> Void) {
        let url = WeatherByCity.urlForWeather(city: path)
        let urlRequest = URLRequest(url: url )
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

enum NetworkError: Error {
    case dataNotFound
}
