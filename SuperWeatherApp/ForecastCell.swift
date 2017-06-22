//
//  ForecastCell.swift
//  SuperWeatherApp
//
//  Created by Sukhrat on 21.06.17.
//  Copyright © 2017 Sukhrat. All rights reserved.
//

import UIKit

class ForecastCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var dayLbl: UILabel!
    @IBOutlet weak var forecastTempLbl: UILabel!
    
    func configureCell(forecast: Forecast) {
        
        thumbImg.image = UIImage(named: forecast.weatherType)
        dayLbl.text = forecast.day
        forecastTempLbl.text = "\(Int(forecast.maxTemp))°/\(Int(forecast.minTemp))°"
        
    }
}
