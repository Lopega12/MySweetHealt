//
//  Stat.swift
//  BienestarDigital
//
//  Created by Loren on 13/02/2020.
//  Copyright © 2020 Loren. All rights reserved.
//

import Foundation
class Stat : Codable{
    var fecha : String!
    var time : String!
    var nameApp: String!
    
    init(fecha: String,time: String,nameApp: String){
        self.fecha = fecha
        self.time = time
        self.nameApp = nameApp
    }
    
}
