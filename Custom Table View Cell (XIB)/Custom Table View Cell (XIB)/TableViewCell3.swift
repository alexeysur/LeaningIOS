//
//  TableViewCell3.swift
//  Custom Table View Cell (XIB)
//
//  Created by Admin on 08.02.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

struct cellColl {
    let cell: Int!
    let nametext: String!
    let image: UIImage!
    
}

class TableViewCell3: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet var collView: UICollectionView!
  
    var arrayCellColl = [cellColl]()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        arrayCellColl = [cellColl(cell: 1, nametext: "Text1", image: #imageLiteral(resourceName: "zakaznoyP202yarusn2")),
                         cellColl(cell: 2, nametext: "Text2", image: #imageLiteral(resourceName: "zakaznoyP202yarusn3")),
                         cellColl(cell: 1, nametext: "Text3", image: #imageLiteral(resourceName: "zakaznoyP202yarusn1")),
                         cellColl(cell: 2, nametext: "Text4", image: #imageLiteral(resourceName: "zakaznoyP202yarusn2")) ]
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return arrayCellColl.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = Bundle.main.loadNibNamed("CollectionViewCell", owner: self, options: nil)?.first as! CollectionViewCell
        cell.imageView.image = arrayCellColl[indexPath.row].image
        
        return cell
    }

}
