//
//  AddFoodTableView.swift
//  MultiTableView
//
//  Created by Admin on 21.01.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import AVFoundation

class AddFoodTableView: UITableViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

  let kindFood = ["Vegetables","Fruit","Berry","Meat"]
  var imagePicker: UIImagePickerController!

  @IBAction func pressCamera(_ sender: Any) {
      imagePicker = UIImagePickerController()
      imagePicker.delegate = self
      imagePicker.sourceType = .camera
      imagePicker.allowsEditing = true
    
    present(imagePicker, animated: true, completion: nil)
  }

  @IBOutlet weak var imageFood: UIImageView!
  @IBOutlet weak var titleTextField: UITextField!
  @IBOutlet weak var kindSegment: UISegmentedControl!
  @IBOutlet weak var priceTextField: UITextField!
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    imagePicker.dismiss(animated: true, completion: nil)
    imageFood.image = info[UIImagePickerControllerOriginalImage] as? UIImage
  }
  
  @IBAction func tapSaveButton(_ sender: Any) {
    let title = titleTextField.text
    let kind = kindFood[kindSegment.selectedSegmentIndex]
    let price = Float(priceTextField.text!)
    
    // Проверка на валидность введенных строк
    if title == "" || kind == "" || price == 0 {
      let alertController = UIAlertController(title: "Oops", message: "We can't proceed because one of the fields is blank. Please note that all fields are required.", preferredStyle: .alert)
      alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
      self.present(alertController, animated: true, completion: nil)
      
      return
    }
    // Вывод введенных данных в консоль
    print("Name: \(title)")
    print("Kind: \(kind)")
    print("Price: \(price)")
    
    dismiss(animated: true, completion: nil)

  }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      if indexPath.row == 0 {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
          let imagePicker = UIImagePickerController()
          imagePicker.delegate = self
          imagePicker.allowsEditing = false
          imagePicker.sourceType = .photoLibrary
          
          self.present(imagePicker, animated: true, completion: nil)
        }
      }
      tableView.deselectRow(at: indexPath, animated: true)
  }
 
   
  
}
