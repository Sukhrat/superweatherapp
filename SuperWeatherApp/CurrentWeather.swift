//
//  CurrentWeather.swift
//  SuperWeatherApp
//
//  Created by Sukhrat on 16.06.17.
//  Copyright © 2017 Sukhrat. All rights reserved.
//

import Foundation
import Alamofire

class CurrentWeather {
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp: Double!
    var _windSpeed: Int!
    var _airPressure: Int!
    var _humidity: Int!
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        
        return _cityName
    }
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    var windSpeed: Int {
        if _windSpeed == nil {
            _windSpeed = 0
        }
        return _windSpeed
    }
    
    var airPressure: Int {
        if _airPressure == nil {
            _airPressure = 0
        }
        return _airPressure
    }
    
    var humidity: Int {
        if _humidity == nil {
            _humidity = 0
        }
        return _humidity
    }
    
    func downloadWeatherDetails(complete: @escaping DownloadComplete) {
        Alamofire.request(CURRENT_WEATHER_URL).responseJSON { (response) in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let name = dict["name"] as? String {
                    self._cityName = name
                }
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main
                    }
                }
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    if let temp = main["temp"] as? Double {
                        self._currentTemp = temp
                    }
                    if let pressure = main["pressure"] as? Int {
                        self._airPressure = pressure
                    }
                    if let humidity = main["humidity"] as? Int {
                        self._humidity = humidity
                    }
                }
                if let wind = dict["wind"] as? Dictionary<String, AnyObject> {
                    if let speed = wind["speed"] as? Int {
                        self._windSpeed = speed
                    }
                }
            }
            complete()
        }
    }
}
