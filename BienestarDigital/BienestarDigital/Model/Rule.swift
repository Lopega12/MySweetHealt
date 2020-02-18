//
//  Rule.swift
//  BienestarDigital
//
//  Created by Loren on 18/02/2020.
//  Copyright © 2020 Loren. All rights reserved.
//

import UIKit
class Rule : Codable{
    var maxAllow : Int!
    var hInit : String?
    var hFinish : String?
    init(maxAllow: Int,hInit : String, hFinish: String){
        self.maxAllow = maxAllow
        self.hInit = hInit
        self.hFinish = hFinish
    }
}
