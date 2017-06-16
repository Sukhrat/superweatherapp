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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // addShadowTo(weatherImg)
        addShadowTo(currentTempLbl)
        addShadowTo(currentWeatherTypeLbl)
        addShadowTo(cityLbl)
    }
    
    func addShadowTo(_ obj: AnyObject) {
        obj.layer.shadowColor = UIColor.black.cgColor
        obj.layer.shadowOpacity = 1

        obj.layer.shadowOffset = CGSize.zero
        obj.layer.shadowRadius = 10.0
    }

   
}

