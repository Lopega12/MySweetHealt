//
//  Stat.swift
//  BienestarDigital
//
//  Created by Loren on 13/02/2020.
//  Copyright © 2020 Loren. All rights reserved.
//

import Foundation
class Stat : Codable{
    var fecha : String?
    var time : String?
    
    init(fecha: String,time: String){
        self.fecha = fecha
        self.time = time
    }
    
}
