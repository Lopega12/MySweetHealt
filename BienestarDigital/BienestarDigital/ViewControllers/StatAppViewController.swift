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
    public var app_id = ""
    let AF = ApiMagnament()
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var dailytime: UILabel!
    
    override func viewDidLoad() {
       
        var app =  AF.getAppDetail(app: app_id, completion: {
            result in
            self.setDetailsView(app: result!)
        })
        
        super.viewDidLoad()
    }
    func setDetailsView(app: TheApp){
        icon.image = UIImage(named: app.image!)
        name.text = app.name
        
    }
}
