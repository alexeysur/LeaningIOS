//
//  ViewController.swift
//  TestProject
//
//  Created by Admin on 03.01.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  var counter = 0
  
  @IBOutlet weak var labelCounter: UILabel!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
  labelCounter.text = "0"
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  @IBAction func tapButtonCounter(_ sender: UIButton) {
    counter += 1
    labelCounter.text = String(counter)
  }

  @IBAction func resetButtonCounter(_ sender: UIBarButtonItem) {
  
  counter = 0
  labelCounter.text = String(counter)
  }
  
  @IBAction func tapPressLong(_ sender: UITapGestureRecognizer) {
    let startPoint: CGPoint
    var movePoint: CGPoint
    
    
  switch sender.state {
    case .began:
       startPoint = sender.location(in: "Tap or Hold")
    case .changed:
       movePoint = sender.location(ofTouch: 1, in: "Tap or Hold")
      counter += 1
      labelCounter.text = String(counter)
    case .cancelled, .ended:
       finishTime = DispatchTime.now() - startTime
       counter += Int(finishTime.uptimeNanoseconds*1000000000)
    default:
      break
    }
    
    
  }

  
  
  
}

