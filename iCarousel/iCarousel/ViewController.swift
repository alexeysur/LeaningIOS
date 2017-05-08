//
//  ViewController.swift
//  iCarousel
//
//  Created by Admin on 27.01.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, iCarouselDelegate, iCarouselDataSource {

  @IBOutlet var carousel: iCarousel!
  var numbers = [Int]()
  
  override func awakeFromNib() {
    super.awakeFromNib()
    numbers = [1,2,3,4,5,6]
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    numbers = [1,2,3,4,5,6]
    carousel.type = .coverFlow
  }

  func numberOfItems(in carousel: iCarousel) -> Int {
    return numbers.count
  }
  
  func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
  
    let tempView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
    var button = UIButton(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
    button.setTitle("\(index)", for: .normal)
    tempView.backgroundColor = UIColor.blue
    button.backgroundColor = UIColor.red
    tempView.addSubview(button)

    return tempView
  }
  
  func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
    if option == iCarouselOption.spacing {
      return value * 1.1
    }
    return value
  }
  
  func carousel(_ carousel: iCarousel, didSelectItemAt index: Int) {
      print("Index = \(index)")
  
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

