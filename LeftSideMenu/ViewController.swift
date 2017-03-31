//
//  ViewController.swift
//  LeftSideMenu
//
//  Created by Admin on 06.02.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnMenuButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        btnMenuButton.target = revealViewController()
        btnMenuButton.action = #selector(SWRevealViewController.revealToggle(_:))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

