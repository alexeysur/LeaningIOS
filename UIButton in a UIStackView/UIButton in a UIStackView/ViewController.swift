//
//  ViewController.swift
//  UIButton in a UIStackView
//
//  Created by Admin on 14.01.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var label1: UILabel!
  
  func styleLabel() {
    label1.backgroundColor = UIColor.gray
    label1.textColor = UIColor.blue
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    gradientBackground()
    styleLabel()
  }

  @IBAction func pressButtonImage(_ sender: Any) {
    let alert = UIAlertController(title: "Game Over!", message: "Play again?", preferredStyle: .alert)
    let actionOK = UIAlertAction(title: "Yes", style: .default, handler: newGame(_:))
    let actionCancel = UIAlertAction(title: "No", style: .default, handler: noPlay(_:))
    
    alert.addAction(actionCancel)
    alert.addAction(actionOK)
    
    present(alert, animated: true, completion: nil)
  }

  func newGame(_ action:UIAlertAction) {
    let alertController = UIAlertController(title: "Login:", message: "Input login and password:", preferredStyle: .alert)
    let alertActionOk = UIAlertAction(title: "Ok", style: .default, handler: nil)
    
    alertController.addTextField(configurationHandler: { (loginTF) in loginTF.placeholder = "Your e-mail"})
    alertController.addTextField(configurationHandler: { (passwdTF) in
      passwdTF.placeholder = "Your password"
      passwdTF.isSecureTextEntry = true
    })
    
    alertController.addAction(alertActionOk)
    present(alertController, animated: true, completion: nil)
    
    
  }
  
  func noPlay(_ action: UIAlertAction) {
    label1.text = "That's all folks!"
    
  }
  
  func gradientBackground() {
    let color1 = UIColor(red: 153/255, green: 26/255, blue: 61/255, alpha: 1.0).cgColor
    let color2 = UIColor(red: 243/255, green: 155/255, blue: 51/255, alpha: 1.0).cgColor
    let color3 = UIColor(red: 183/255, green: 34/255, blue: 69/255, alpha: 1.0).cgColor
    
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = self.view.bounds
    gradientLayer.colors = [color1, color2, color3]
    gradientLayer.startPoint = CGPoint(x:0.0, y:0.0)
    gradientLayer.endPoint = CGPoint(x:0.0, y:1.0)
    self.view.layer.insertSublayer(gradientLayer, at: 0)
    
  }

}

