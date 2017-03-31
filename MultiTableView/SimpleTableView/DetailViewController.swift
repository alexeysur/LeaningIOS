//
//  DetailViewController.swift
//  DetailTableView
//
//  Created by Admin on 21.01.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var imageView: UIImageView!
  
  var food: String!
  var kind: String!
  var image: String!
  var newPrice: Float!
  
    override func viewDidLoad() {
        super.viewDidLoad()

      // Дополнительные действия после загрузки view
      imageView.image = UIImage(named: image)
      
      // Сменить цвет TableView
      tableView.backgroundColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.2)
      
      // Убрать разделители пустых ячеек
  //    tableView.tableFooterView = UIView(frame: RectZero)
      
      // Сменить цвет разделителей
      tableView.separatorColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.8)
      
      // Сменить title в navigationBar
      title = food

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  //Data Source Protocol
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as! FoodDetailTableViewCell
    
    switch indexPath.row {
      case 0:
        cell.fieldLabel!.text = "Title:"
        cell.valueLabel!.text = food
      case 1:
        cell.fieldLabel!.text = "Kind:"
        cell.valueLabel!.text = kind
     case 2:
      cell.fieldLabel!.text = "Price:"
      cell.valueLabel!.text = String(newPrice)
     default:
      cell.fieldLabel!.text = ""
      cell.valueLabel!.text = ""
    
    }
    
    return cell
  }


  override func viewWillAppear(_ animated: Bool) {
    navigationController?.hidesBarsOnSwipe = false
    navigationController?.setNavigationBarHidden(false, animated: true)

  }

  /*
   // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = tableView.indexPath(for: sender as! UITableViewCell)!
        let detailGood = segue.destination as! DetailViewController
  
    }
  */

}
