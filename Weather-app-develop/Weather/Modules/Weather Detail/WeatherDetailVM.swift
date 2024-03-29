//
//  WeatherDetailVM.swift
//  Weather
//
//  Created by Naveen Chowdary on 05/05/23.
//

import Foundation

protocol WeatherDetailVMDelegate {
    func startLoading()
    func weatherLoaded()
    func stopLoading()
}

class WeatherDetailVM {
    
    var delegate: WeatherDetailVMDelegate?
    
    var weatherData: WeatherData?
    
    var location: SearchResultModel? {
        didSet {
            self.fetchWeather()
        }
    }
    
    func fetchWeather() {
        self.delegate?.startLoading()
        // API call to fetch weather
        WeatherAPI.provider.request(
            .weatherFor(
                lat: location?.lat ?? 0.0,
                long: location?.lon ?? 0.0
            )
        ) { [weak self] result in
            switch result{
            case .success(let response):
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                self?.weatherData = try? decoder.decode(
                    WeatherData.self,
                    from: response.data
                )
                self?.delegate?.weatherLoaded()
                self?.delegate?.stopLoading()
            case .failure(let error):
                print(error)
            }
        }
    }
}
