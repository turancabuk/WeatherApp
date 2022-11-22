//
//  WeatherListCell.swift
//  weatherApp
//
//  Created by Turan Çabuk on 18.11.2022.
//

import UIKit

class WeatherListCell: UITableViewCell {
    
    @IBOutlet weak var cityNameLabel: UILabel!

    func configure(_ vm: MainViewModel) {
        
        self.cityNameLabel.text = vm.weather.name
        
    }
}
