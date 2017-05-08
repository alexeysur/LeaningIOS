//
//  ViewController.swift
//  ContainerView
//
//  Created by Admin on 13.04.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func pressedNames(_ sender: Any) {
        let data = ["Alex", "Andrey", "Sergey", "Pavel", "Alexsandr", "Valik", "Vadim"]
        (childViewControllers[0] as? InfoTableViewController)?.modArray = data
        (childViewControllers[0] as? InfoTableViewController)?.tableView.reloadData()
    
    }
    @IBAction func pressedNumbers(_ sender: Any) {
        let data = ["First", "Second", "Third", "Fourth", "Firth", "Sixth", "Seventh"]
        (childViewControllers[0] as? InfoTableViewController)?.modArray = data
        (childViewControllers[0] as? InfoTableViewController)?.tableView.reloadData()

    
    }
    @IBAction func pressedColors(_ sender: Any) {
        let data = ["Red", "Green", "Blue", "White", "Black", "Yellow", "Orange", "Gray"]
        (childViewControllers[0] as? InfoTableViewController)?.modArray = data
        (childViewControllers[0] as? InfoTableViewController)?.tableView.reloadData()

    
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "InfoSegue" {
            let infoTabVC = segue.destination as? InfoTableViewController
            infoTabVC?.modArray = ["Swift", "Data", "Send", "in", "Container View"]
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

