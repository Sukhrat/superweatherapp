//
//  Constants.swift
//  SuperWeatherApp
//
//  Created by Sukhrat on 16.06.17.
//  Copyright © 2017 Sukhrat. All rights reserved.
//

import Foundation

typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather?lat=43&lon=77&appid=696598ff6f9da2cc218ebe4d890453ca"

let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=43&lon=77&cnt=10&appid=696598ff6f9da2cc218ebe4d890453ca"
