//
//  MainModel.swift
//  weatherApp
//
//  Created by Turan Çabuk on 17.11.2022.
//

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let cod: String?
    let message, cnt: Int?
    let list: [List]?
    let city: City?
}

// MARK: - City
struct City: Codable {
    let id: Int?
    let name: String?
    let coord: Coord?
    let country: String?
    let population, timezone, sunrise, sunset: Int?
}

// MARK: - Coord
struct Coord: Codable {
    let lat, lon: Double?
}

// MARK: - List
struct List: Codable {
    let dt: Int?
    let main: MainClass?
    let weather: [Weather]?
    let clouds: Clouds?
    let wind: Wind?
    let visibility: Int?
    let pop: Double?
    let snow: Snow?
    let sys: Sys?
    let dtTxt: String?

    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, visibility, pop, snow, sys
        case dtTxt
    }
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int?
}

// MARK: - MainClass
struct MainClass: Codable {
    let temp, feelsLike, tempMin, tempMax: Double?
    let pressure, seaLevel, grndLevel, humidity: Int?
    let tempKf: Double?

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike
        case tempMin
        case tempMax
        case pressure
        case seaLevel
        case grndLevel
        case humidity
        case tempKf
    }
}

// MARK: - Snow
struct Snow: Codable {
    let the3H: Double?

    enum CodingKeys: String, CodingKey {
        case the3H
    }
}

// MARK: - Sys
struct Sys: Codable {
    let pod: Pod?
}

enum Pod: String, Codable {
    case d = "d"
    case n = "n"
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int?
    let main: MainEnum?
    let weatherDescription, icon: String?

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription
        case icon
    }
}

enum MainEnum: String, Codable {
    case clouds = "Clouds"
    case rain = "Rain"
    case snow = "Snow"
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double?
    let deg: Int?
    let gust: Double?
}
