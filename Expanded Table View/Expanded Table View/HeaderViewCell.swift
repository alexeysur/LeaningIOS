//
//  HeaderViewCell.swift
//  Expanded Table View
//
//  Created by Admin on 17.02.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class HeaderViewCell: UITableViewCell {

    @IBOutlet var headerImageView: UIImageView!
    @IBOutlet var headerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
