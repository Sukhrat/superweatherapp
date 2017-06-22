//
//  ViewController.swift
//  SuperWeatherApp
//
//  Created by Sukhrat on 16.06.17.
//  Copyright © 2017 Sukhrat. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var weatherImg: UIImageView!
    @IBOutlet weak var currentTempLbl: UILabel!
    @IBOutlet weak var currentWeatherTypeLbl: UILabel!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var windSpeedLbl: UILabel!
    @IBOutlet weak var humidityLbl: UILabel!
    @IBOutlet weak var pressureLbl: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var currentWeather: CurrentWeather!
    var forecasts = [Forecast]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // addShadowTo(weatherImg)
        addShadowTo(currentTempLbl)
        addShadowTo(currentWeatherTypeLbl)
        addShadowTo(cityLbl)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        
        currentWeather = CurrentWeather()
        currentWeather.downloadWeatherDetails {
            self.downloadForecastData {
                self.updateMainUI()
            }
            
        }
    }
    
    func downloadForecastData(complete: @escaping DownloadComplete) {

        Alamofire.request(FORECAST_URL).responseJSON { (response) in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
                    
                    for obj in list {
                        
                        let forecast = Forecast(weatherDict: obj)
                        self.forecasts.append(forecast)
                        
                    }
                    
                }
                
            }
            self.forecasts.remove(at: 0)
            self.collectionView.reloadData()
            complete()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ForecastCell", for: indexPath) as? ForecastCell {
            
            cell.configureCell(forecast: forecasts[indexPath.row])
            
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return forecasts.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
   
}

