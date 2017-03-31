//
//  TableViewCell2.swift
//  Custom Table View Cell (XIB)
//
//  Created by Admin on 08.02.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class TableViewCell2: UITableViewCell {

  
    @IBOutlet var mainImage: UIImageView!
    @IBOutlet weak var cell2: UILabel!
    @IBOutlet weak var label2: UILabel!
     override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
