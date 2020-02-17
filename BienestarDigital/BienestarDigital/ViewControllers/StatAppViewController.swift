//
//  StatAppViewController.swift
//  BienestarDigital
//
//  Created by Loren on 09/02/2020.
//  Copyright © 2020 Loren. All rights reserved.
//

import Foundation
import UIKit
class StatAppViewController : UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    public var app_id = ""
    let AF = ApiMagnament()
    
    var stats : [Stat] = []
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var dailytime: UILabel!
    
    @IBOutlet weak var beforeDaysTable: UITableView!
    
    override func viewDidLoad() {
       
        var app =  AF.getAppDetail(app: app_id, completion: {
            result in
            self.setDetailsView(app: result!)
        })
        
        var daysBefore = AF.getBeforeDates(from: app_id, completion: {
            result in
            self.setStatsforTable(states: result)
            
        })
        
        self.beforeDaysTable.dataSource = self
        self.beforeDaysTable.delegate = self
        super.viewDidLoad()
    }
    func setDetailsView(app: TheApp){
        icon.image = UIImage(named: app.image!)
        name.text = app.name
        dailytime.text = String(format:"%f", app.calcDaily(daily: 2.2))
        
    }
    
    func setStatsforTable(states: [Stat]){
        self.stats = states
        beforeDaysTable.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.stats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "state", for: indexPath) as! TableViewStatsCell
        let state = stats[indexPath.row]
        cell.dateLabel.text = state.fecha
        cell.timeLabel.text = state.time
        return cell
    }
    
}
