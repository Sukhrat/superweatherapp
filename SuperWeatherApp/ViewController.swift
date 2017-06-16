//
//  ViewController.swift
//  SuperWeatherApp
//
//  Created by Sukhrat on 16.06.17.
//  Copyright © 2017 Sukhrat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var weatherImg: UIImageView!
    @IBOutlet weak var currentTempLbl: UILabel!
    @IBOutlet weak var currentWeatherTypeLbl: UILabel!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var windSpeedLbl: UILabel!
    @IBOutlet weak var humidityLbl: UILabel!
    @IBOutlet weak var pressureLbl: UILabel!
    
    var currentWeather: CurrentWeather!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // addShadowTo(weatherImg)
        addShadowTo(currentTempLbl)
        addShadowTo(currentWeatherTypeLbl)
        addShadowTo(cityLbl)
        
        currentWeather = CurrentWeather()
        currentWeather.downloadWeatherDetails {
            self.updateMainUI()
        }
    }
    
    func addShadowTo(_ obj: AnyObject) {
        obj.layer.shadowColor = UIColor.black.cgColor
        obj.layer.shadowOpacity = 1

        obj.layer.shadowOffset = CGSize.zero
        obj.layer.shadowRadius = 10.0
    }
    
    func updateMainUI() {
        self.weatherImg.image = UIImage(named: currentWeather.weatherType)
        self.currentTempLbl.text = "\(Int(currentWeather.currentTemp - 273.15))°C"
        self.currentWeatherTypeLbl.text = currentWeather.weatherType
        self.cityLbl.text = currentWeather.cityName
        self.windSpeedLbl.text = "\(currentWeather.windSpeed)km/h"
        self.humidityLbl.text = "\(currentWeather.humidity)%"
        self.pressureLbl.text = "\(currentWeather.airPressure)hpa"
    }

   
}

