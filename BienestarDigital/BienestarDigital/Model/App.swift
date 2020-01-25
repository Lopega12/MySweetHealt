//
//  App.swift
//  BienestarDigital
//
//  Created by Loren on 25/01/2020.
//  Copyright © 2020 Loren. All rights reserved.
//

import UIKit
class App : Codable{
    var name: String,image: String
    var time: NSDate
    var latitude: Double,lonigutde:Double
    
    init(name: String,image: String,latitude:Double,longitude:Double, time: NSDate) {
        if(!name.isEmpty && !latitude.isNaN && !longitude.isNaN){
            self.name = name
            self.latitude = latitude
            self.lonigutde = longitude
            if(!image.isEmpty){
                self.image = image
            }
        }
        
    }
}
