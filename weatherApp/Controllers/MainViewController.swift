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
enum NetworkError: Error {
    case dataNotFound
}




