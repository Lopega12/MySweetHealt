//
//  AppsTableViewTableViewCell.swift
//  BienestarDigital
//
//  Created by Loren on 25/01/2020.
//  Copyright © 2020 Loren. All rights reserved.
//

import UIKit

class AppsTableViewTableViewCell: UITableViewCell {

    @IBOutlet weak var imageAppCell: UIImageView!
    @IBOutlet weak var nameAppCell: UILabel!
    @IBOutlet weak var timeAppCell: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
