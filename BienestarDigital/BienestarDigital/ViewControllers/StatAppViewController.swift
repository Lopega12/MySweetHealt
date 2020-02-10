//
//  StatAppViewController.swift
//  BienestarDigital
//
//  Created by Loren on 09/02/2020.
//  Copyright © 2020 Loren. All rights reserved.
//

import Foundation
import UIKit
class StatAppViewController : UIViewController{
    let AF = ApiMagnament()
    override func viewDidLoad() {
        var app =  AF.getAppDetail(app: 1, completion: {
            result in
            print(result!)
        })
        
        super.viewDidLoad()
    }
}
