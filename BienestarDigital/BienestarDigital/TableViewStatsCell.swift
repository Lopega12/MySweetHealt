//
//  TableViewStatsCell.swift
//  BienestarDigital
//
//  Created by Loren on 13/02/2020.
//  Copyright © 2020 Loren. All rights reserved.
//

import UIKit
class TableViewStatsCell: UITableViewCell{
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
