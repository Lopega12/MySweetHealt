//
//  App.swift
//  BienestarDigital
//
//  Created by Loren on 25/01/2020.
//  Copyright © 2020 Loren. All rights reserved.
//

import UIKit
class TheApp : Codable{
    var name: String!,image: String?
    var time: String!
    var latitude: Double!,lonigutde:Double!
    var dailyTime : Double?
    var rule: Rule?
    init(name: String,latitude:Double,longitude:Double, time: String,imageURL: String?) {
            self.name = name
            self.latitude = latitude
            self.lonigutde = longitude
            if(!imageURL!.isEmpty){
                self.image = imageURL!
            }
        self.time = time
        
    }
    
    init(name: String,latitude:Double,longitude:Double, time: String,imageURL: String?,rules: Rule) {
            self.name = name
            self.latitude = latitude
            self.lonigutde = longitude
            if(!imageURL!.isEmpty){
                self.image = imageURL!
            }
        self.time = time
        self.rule = rules
        
    }
    

//Calculo del tiempo con respecto a la hora actual,
    public func calcDaily(daily:Double)->Double{
//        A medio implementar
        return daily;
    }
    
}
