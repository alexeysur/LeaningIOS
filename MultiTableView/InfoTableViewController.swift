//
//  InfoTableViewController.swift
//  DetailTableView
//
//  Created by Admin on 21.01.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class InfoTableViewController: UITableViewController {

  @IBOutlet weak var imageView: UIImageView!
  var imageFood: String!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      imageView.image = UIImage(named: imageFood)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

  
}
