//
//  MainViewController.swift
//  weatherApp
//  Created by Turan Çabuk on 17.11.2022.

import UIKit
import CoreLocation

class MainViewController: UIViewController {
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var searchTextfield: UITextField!
    @IBOutlet weak var minTemp: UILabel!
    @IBOutlet weak var maxTemp: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherManager.delegate = self
        searchTextfield.delegate = self
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
    }
    
    @IBAction func locationButton(_ sender: Any) {
        locationManager.requestLocation()
        
    }
    @IBAction func searchButton(_ sender: Any) {
        if searchTextfield.text == "" {
            alert(title: "ERROR", message: "enter a city")
        }
        searchTextfield.endEditing(true)    }
}

extension MainViewController: UITextFieldDelegate, WeatherManagerDelegate {
    func updateWeather(_ WeatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.temperatureLabel.text = "\(weather.temperatureString)ºC"
            self.conditionImageView.image = UIImage(named: weather.conditionName)
            self.cityLabel.text = weather.cityName
            self.countryName.text = weather.countryName
            self.minTemp.text = "\(weather.minTemp)ºC"
            self.maxTemp.text = "\(weather.maxTemp)ºC"
            self.humidityLabel.text = "\(weather.humidity)%"
            self.descriptionLabel.text = weather.description
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextfield.endEditing(true)
        return true
    }
    private func textfieldDidEndEditing(_ textfield: UITextField) {
        if textfield.text != "" {
        } else {
            alert(title: "ERROR", message: "enter a city")
            textfield.placeholder = "search a city"
        }
    }
    func textFieldDidEndEditing(_ textfield: UITextField) {
        if let city = searchTextfield.text {
            weatherManager.weatherByTextField(cityName: city)
        }
        searchTextfield.text = ""
    }
    func alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default))
        self.present(alert, animated: true)
        
    }
    func failError(error: Error) {
        DispatchQueue.main.async {
            self.alert(title: "Error, City Not Found", message: "Check the Name")
        }
    }
}

extension MainViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.fecthWeatherLocation(latitude: lat, longitude: lon)
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
        print("location error:", error)
    
    }
}

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
