//
//  CustomTableViewCell.swift
//  SimpleTableView
//
//  Created by Admin on 20.01.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
  
  @IBOutlet weak var thumbnailImageView: UIImageView!
    
  @IBOutlet weak var title: UILabel!
  @IBOutlet weak var kind: UILabel!
  @IBOutlet weak var price: UILabel!
  

    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    
    }

}
