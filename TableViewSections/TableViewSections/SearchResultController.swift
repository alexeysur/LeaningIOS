//
//  SearchResultController.swift
//  TableViewSections
//
//  Created by Admin on 22.01.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class SearchResultController: UITableViewController, UISearchResultsUpdating {
  
  private static let longNameSize = 6
  private static let shortNamesButtonIndex = 1
  private static let longNamesButtonIndex = 2
  
  let sectionsTableIdentifier = "SectionsTableIdentifier"
  var names: [String: [String]] = [String: [String]]()
  var keys: [String] = []
  var filteredNames: [String] = []
 
  
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: sectionsTableIdentifier)
    }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return filteredNames.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
    -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: sectionsTableIdentifier)
      cell!.textLabel?.text = filteredNames[indexPath.row]
      return cell!
  }

  
  // MARK: - Navigation

  func updateSearchResults(for searchController: UISearchController) {
    if let searchString = searchController.searchBar.text {
        let buttonIndex = searchController.searchBar.selectedScopeButtonIndex
        filteredNames.removeAll(keepingCapacity: true)
      
      if !searchString.isEmpty {
        let filter: (String) -> Bool = { name in
          
          let nameLength = name.characters.count
          if (buttonIndex == SearchResultController.shortNamesButtonIndex &&
              nameLength >= SearchResultController.longNameSize) ||
             (buttonIndex == SearchResultController.longNamesButtonIndex &&
              nameLength < SearchResultController.longNameSize) {
            return false
          }
          
          let range = name.range(of: searchString, options: NSString.CompareOptions.caseInsensitive)
          
          return range != nil
        }
        for key in keys {
          let namesForKey = names[key]!
          let matches = namesForKey.filter(filter)
          filteredNames += matches
        }
      }
        tableView.reloadData()
    }
    
  }

}
