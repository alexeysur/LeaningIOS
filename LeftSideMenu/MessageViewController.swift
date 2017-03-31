//
//  MessageViewController.swift
//  LeftSideMenu
//
//  Created by Admin on 06.02.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController {

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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
