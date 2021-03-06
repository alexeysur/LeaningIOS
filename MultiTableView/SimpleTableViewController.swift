//
//  SimpleTableViewController.swift
//  SimpleTableView
//
//  Created by Admin on 14.01.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class SimpleTableViewController: UITableViewController {
  
   var foods: [String] = ["Apple","Asparagus","Avocado","Baby Bottle","Bacon","Banana Split","Banana","Bar","Bavarian Beer Mug","Beet","Broccoli","Cherry","Crab","Limon"]
   var images: [String] = ["Apple.png","Asparagus.png","Avocado.png","Baby Bottle.png","Bacon.png","Banana Split.png","Banana.png","Bar.png","Bavarian Beer Mug.png","Beet.png","Broccoli.png","Cherry.png","Crab.png","Limon.png"]
   var kind: [String] = ["fruit", "vegetables", "ruit","",
                        "meat","fruit","fruit","","",
                        "meat","vegetables","berry", "meat", "fruit"]
  var newPrice:[Float] = [1.2,36.8,77.4,63.12,125,99.99,45.55,34.26,23.89,69.45,72.56,92.12,26.94,14.87]
 
    override func viewDidLoad() {
        super.viewDidLoad()

     
       self.tableView.separatorColor = UIColor.blue
       self.tableView.separatorStyle = UITableViewCellSeparatorStyle.singleLine
      
      // Удалить title у кнопки  back
      navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
      
        // Uncomment the following line to preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = self.editButtonItem
        // self.isEditing = true
    }
  
  override func viewWillAppear(_ animated: Bool) {
     super.viewWillAppear(true)
     navigationController?.hidesBarsOnSwipe = true
  //   prefersStatusBarHidden
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

  
  
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return foods.count
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
      cell.thumbnailImageView!.image = UIImage(named: images[indexPath.row])
            cell.title!.text = foods[indexPath.row]
            cell.kind!.text = kind[indexPath.row]
            cell.price!.text = String(newPrice[indexPath.row])

        return cell
    }
  

  
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
  

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
      
           foods.remove(at: indexPath.row)
           images.remove(at: indexPath.row)
           newPrice.remove(at: indexPath.row)
           kind.remove(at: indexPath.row)
    
          tableView.deleteRows(at: [indexPath], with: .fade)
          
          
        } else if editingStyle == .insert {
          
        }
   

    }
  
 
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
  
 
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
  
  
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if segue.identifier == "DetailShow" {
         if let indexPath = tableView.indexPathForSelectedRow {
            let destinationController = segue.destination as! DetailViewController
              destinationController.food = foods[indexPath.row]
              destinationController.image = images[indexPath.row]
              destinationController.kind = kind[indexPath.row]
              destinationController.newPrice = newPrice[indexPath.row]
          
          }
      }
      if segue.identifier == "InfoShow" {
        if let indexPath = tableView.indexPathForSelectedRow  {
            let destinationController = segue.destination as! InfoTableViewController
                destinationController.imageFood = images[indexPath.row]
        }
      }
    }
  
  @IBAction  func unwind(for unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: SimpleTableViewController) {
    //place
  }

}
