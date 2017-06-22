//
//  MaterialShadow.swift
//  SuperWeatherApp
//
//  Created by Sukhrat on 22.06.17.
//  Copyright © 2017 Sukhrat. All rights reserved.
//

import UIKit

private var materialKey = false

extension UIView {
    
    

    @IBInspectable var shadowCustom: Bool {
        
        get {
            
            return materialKey
            
        }
        
        set {
            
            materialKey = newValue
            
            if materialKey {
                
                self.layer.masksToBounds = false
                self.layer.cornerRadius = 3.0
                self.layer.shadowOpacity = 0.8
                self.layer.shadowRadius = 3.0
                self.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
                self.layer.shadowColor = UIColor(red: 157/255, green: 157/255, blue: 157/255, alpha: 1.0).cgColor
                
            }
            
        }
        
    }
    
}
