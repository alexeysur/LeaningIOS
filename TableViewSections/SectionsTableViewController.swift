//
//  SectionsTableViewController.swift
//  TableViewSections
//
//  Created by Admin on 21.01.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class SectionsTableViewController: UITableViewController {

  let sectionsTableIdentifier = "SectionsTableIdentifier"
  var names: [String: [String]]!
  var keys: [String]!
  
  @IBOutlet weak var tableViewNames: UITableView!
  var searchController: UISearchController!
  
    override func viewDidLoad() {
      super.viewDidLoad()
      tableViewNames.register(UITableViewCell.self, forCellReuseIdentifier: sectionsTableIdentifier)
      
      
      let path = Bundle.main.path(forResource: "sortednames", ofType: "plist")
      let nameDict = NSDictionary(contentsOfFile: path!)
      names = nameDict as! [String: [String]]
      keys = (nameDict!.allKeys as! [String]).sorted()
     
      let resultsController = SearchResultController()
      resultsController.names = names
      resultsController.keys = keys
      searchController = UISearchController(searchResultsController: resultsController)
      let searchBar = searchController.searchBar
      searchBar.scopeButtonTitles = ["All","Short","Long"]
      searchBar.placeholder = "Enter a search term"
      searchBar.sizeToFit()
      tableView.tableHeaderView = searchBar
      searchController.searchResultsUpdater = resultsController
      
      tableViewNames.sectionIndexBackgroundColor = UIColor.black
      tableViewNames.sectionIndexTrackingBackgroundColor = UIColor.darkGray
      tableViewNames.sectionIndexColor = UIColor.white
    }

 
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
       return keys.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
      let key = keys[section]
      let nameSection = names[key]!
      
      return nameSection.count
    }

  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return keys[section]
  }
  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: sectionsTableIdentifier, for: indexPath) 

        let key = keys[indexPath.section]
        let nameSection = names[key]!
        cell.textLabel?.text = nameSection[indexPath.row]

        return cell
    }
  
  override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
    return keys
  }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
