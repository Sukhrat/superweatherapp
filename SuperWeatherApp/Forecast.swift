//
//  Forecast.swift
//  SuperWeatherApp
//
//  Created by Sukhrat on 21.06.17.
//  Copyright © 2017 Sukhrat. All rights reserved.
//

import Foundation

class Forecast {
    
    private var _weatherType: String!
    private var _day: String!
    private var _maxTemp: Double!
    private var _minTemp: Double!
    
    var weatherType: String {
        
        if _weatherType == nil {
            
            _weatherType = ""
            
        }
        
        return _weatherType
        
    }
    
    var day: String {
        
        if _day == nil {
            
            _day = ""
            
        }
        
        return _day
        
    }
    
    var maxTemp: Double {
        
        if _maxTemp == nil {
            
            _maxTemp = 0.0
            
        }
        
        return _maxTemp
        
    }
    
    var minTemp: Double {
        
        if _minTemp == nil {
            
            _minTemp = 0.0
            
        }
        
        return _minTemp
        
    }
    
    init(weatherDict: Dictionary<String, AnyObject>) {
        
        if let temp = weatherDict["temp"] as? Dictionary<String, Double> {
            
            self._maxTemp = temp["max"]! - 273.15
            self._minTemp = temp["min"]! - 273.15
            
        }
        
        if let weather = weatherDict["weather"] as? [Dictionary<String, AnyObject>] {
            
            if let main = weather[0]["main"] as? String {
                
                self._weatherType = main
                
            }
            
        }
        
        if let date = weatherDict["dt"] as? Double {
            
            let unixConvertedDate = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "E"
            dateFormatter.timeStyle = .none
            self._day = unixConvertedDate.dayOfTheWeek()
            
        }
        
    }

}

extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E"
        return dateFormatter.string(from: self)
    }
}
