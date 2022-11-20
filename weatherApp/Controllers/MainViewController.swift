//
//  MainViewController.swift
//  weatherApp
//
//  Created by Turan Çabuk on 17.11.2022.
//

import UIKit

class MainViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    var viewModel: MainViewModel?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell") as! WeatherListCell
        //cell.configure(weatherVm)
        cell.cityNameLabel.text = viewModel?.weather.name
        return cell
    }
    
    
    
}

