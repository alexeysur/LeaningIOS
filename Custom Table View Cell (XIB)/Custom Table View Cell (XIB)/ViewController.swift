//
//  ViewController.swift
//  Custom Table View Cell (XIB)
//
//  Created by Admin on 08.02.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

struct cellData {
    let cell: Int!
    let nametext: String!
    let image: UIImage!
    
}

@IBDesignable class TableViewController: UITableViewController  {
    
    var arrayCellData = [cellData]()

    @IBOutlet var viewTop: UIView!
    @IBOutlet var collectionController: UICollectionView!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        arrayCellData = [cellData(cell: 1, nametext: "Text1", image: #imageLiteral(resourceName: "zakaznoyP202yarusn2")),
                         cellData(cell: 2, nametext: "Text2", image: #imageLiteral(resourceName: "zakaznoyP202yarusn3")),
                         cellData(cell: 3, nametext: "Text3", image: #imageLiteral(resourceName: "zakaznoyP202yarusn1")),
                         cellData(cell: 2, nametext: "Text4", image: #imageLiteral(resourceName: "zakaznoyP202yarusn2")) ]
        
  
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(arrayCellData.count)

        return arrayCellData.count
           }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if arrayCellData[indexPath.row].cell == 1 {
            let cell = Bundle.main.loadNibNamed("TableViewCell1", owner: self, options: nil)?.first as! TableViewCell1
            cell.mainImage.image = arrayCellData[indexPath.row].image
            cell.label.text = arrayCellData[indexPath.row].nametext
            
            return cell
            
        } else if arrayCellData[indexPath.row].cell == 2 {
            let cell = Bundle.main.loadNibNamed("TableViewCell2", owner: self, options: nil)?.first as! TableViewCell2
            cell.mainImage.image = arrayCellData[indexPath.row].image
            cell.label2.text = arrayCellData[indexPath.row].nametext
            return cell
            
        } else if arrayCellData[indexPath.row].cell == 3 {
            let cell = Bundle.main.loadNibNamed("TableViewCell3", owner: self, options: nil)?.first as! TableViewCell3
            cell.arrayCellColl.c
         
            return cell
        }
        else {
            let cell = Bundle.main.loadNibNamed("TableViewCell1", owner: self, options: nil)?.first as! TableViewCell1
            cell.mainImage.image = arrayCellData[indexPath.row].image
            cell.label.text = arrayCellData[indexPath.row].nametext
            
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if arrayCellData[indexPath.row].cell == 1 {
               return 225
            
        } else if arrayCellData[indexPath.row].cell == 2 {
               return 168
            
        } else {
            
            return 225
        }

    }
    
}

