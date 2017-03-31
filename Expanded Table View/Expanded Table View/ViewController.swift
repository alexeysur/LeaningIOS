//
//  ViewController.swift
//  Expanded Table View
//
//  Created by Admin on 17.02.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

struct postHeader {
    let image: UIImage!
    let name: String!
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CustomCellDelegate {
    @IBOutlet var tblExpandable: UITableView!

    var headerHeight: CGFloat = 32
    var arrayOfPosts = [postHeader]()
    
    var cellDescriptors: NSMutableArray!
    var visibleRowsPerSection = [[Int]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       arrayOfPosts = [postHeader.init(image: #imageLiteral(resourceName: "radar_marker") , name: "Person"),
                       postHeader.init(image: #imageLiteral(resourceName: "radar_marker") , name: "Preferences"),
                       postHeader.init(image: #imageLiteral(resourceName: "radar_marker") , name: "Work Experience")]
        
   //     tableView.headerView(forSection: 1)?.backgroundColor = UIColor.red
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }

    func loadCellDesciptors() {
        if let path = Bundle.main.path(forResource: "CellDescriptor", ofType: "plist") {
            cellDescriptors = NSMutableArray(contentsOfFile: path)
   
            getIndicesOfVisibleRows()
            tblExpandable.reloadData()
            
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureTableView()
        
        loadCellDesciptors()
       
    }

    func configureTableView() {
  
        tblExpandable.delegate = self
        tblExpandable.dataSource = self
        tblExpandable.tableFooterView = UIView(frame: CGRect.zero)
        
        tblExpandable.register(UINib(nibName: "NormalCell", bundle: nil), forCellReuseIdentifier: "idCellNormal")
        tblExpandable.register(UINib(nibName: "TextFieldCell", bundle: nil), forCellReuseIdentifier: "idCellTextfield")
        tblExpandable.register(UINib(nibName: "DatePickerCell", bundle: nil), forCellReuseIdentifier: "idCellDatePicker")
        tblExpandable.register(UINib(nibName: "SwitchCell", bundle: nil), forCellReuseIdentifier: "idCellSwitch")
        tblExpandable.register(UINib(nibName: "ValuePickerCell", bundle: nil), forCellReuseIdentifier: "idCellValuePicker")
        tblExpandable.register(UINib(nibName: "SliderCell", bundle: nil), forCellReuseIdentifier: "idCellSlider")
    }

    // MARK: UITableView Delegate and Datasource Functions
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if cellDescriptors != nil {
            return cellDescriptors.count
        }
        else {
            return 0
        }
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return visibleRowsPerSection[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentCellDescriptor = getCellDescriptorForIndexPath(indexPath: indexPath as NSIndexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: currentCellDescriptor["cellIdentifier"] as! String, for: indexPath) as! CustomCell
        
        if currentCellDescriptor["cellIdentifier"] as! String == "idCellNormal" {
            if let primaryTitle = currentCellDescriptor["primaryTitle"] {
                cell.textLabel?.text = primaryTitle as? String
            }
            if let secondaryTitle = currentCellDescriptor["secondaryTitle"] {
                cell.detailTextLabel?.text = secondaryTitle as? String
            }
        }
        else if currentCellDescriptor["cellIdentifier"] as! String == "idCellTextfield" {
            cell.textField.placeholder = currentCellDescriptor["primaryTitle"] as? String
        
        }
        else if currentCellDescriptor["cellIdentifier"] as! String == "idCellSwitch" {
            cell.lblSwitchLabel.text = currentCellDescriptor["primaryTitle"] as? String
            
            let value = currentCellDescriptor["value"] as? String
            cell.swMaritalStatus.isOn = (value == "true") ? true : false
        }
        else if currentCellDescriptor["cellIdentifier"] as! String == "idCellValuePicker" {
            cell.textLabel?.text = currentCellDescriptor["primaryTitle"] as? String
        }
        else if currentCellDescriptor["cellIdentifier"] as! String == "idCellSlider" {
            let value = currentCellDescriptor["value"] as! String
            cell.slExperienceLevel.value = (value as NSString).floatValue
        }
 
        cell.delegate = self
        return cell
    }
  
/*
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let indexOfTappedRow = visibleRowsPerSection[indexPath.section][indexPath.row]
   
     if (cellDescriptors[indexPath.section] as! [[String: AnyObject]])[indexOfTappedRow]["isExpandable"] as! Bool == true {
        var shouldExpandAndShowSubRows = false
        if (cellDescriptors[indexPath.section] as! [[String: AnyObject]])[indexOfTappedRow]["isExpandable"] as! Bool == false {
            //In this case the cell should expand
            shouldExpandAndShowSubRows = true
        }
        ((cellDescriptors[indexPath.section] as! NSMutableArray)[indexOfTappedRow] as AnyObject).setValue(shouldExpandAndShowSubRows, forKey: "isExpanded")
        
        for i in (indexOfTappedRow + 1)...(indexOfTappedRow + ((cellDescriptors[indexPath.section] as! [[String: AnyObject]])[indexOfTappedRow]["additionalRows"] as! Int)) {
            ((cellDescriptors[indexPath.section] as! NSMutableArray)[i] as AnyObject).setValue(shouldExpandAndShowSubRows, forKey: "isVisible")
        }
     }
     else {
        if (cellDescriptors[indexPath.section] as! [[String: AnyObject]])[indexOfTappedRow]["cellIdentifier"] as! String == "idCellValuePicker" {
            var indexOfParentCell: Int!
            
  //          for var i = indexOfTappedRow - 1; i>=0; i -= 1 {
            for i in (0...indexOfTappedRow - 1).reversed(){
                if (cellDescriptors[indexPath.section] as! [[String: AnyObject]])[i]["isExpandable"] as! Bool == true {
                    indexOfParentCell = i
                    break
                }
            }
            
            ((cellDescriptors[indexPath.section] as! NSMutableArray)[indexOfParentCell] as AnyObject).setValue((tblExpandable.cellForRow(at: indexPath) as! CustomCell).textLabel?.text, forKey: "primaryTitle")
                
            ((cellDescriptors[indexPath.section] as! NSMutableArray)[indexOfParentCell] as AnyObject).setValue(false, forKey: "isExpanded")
            
                for i in (indexOfParentCell + 1)...(indexOfParentCell + ((cellDescriptors[indexPath.section] as! [[String: AnyObject]])[indexOfParentCell]["addition"] as! Int)) {
                    ((cellDescriptors[indexPath.section] as! NSMutableArray)[i] as AnyObject).setValue(false, forKey: "isVisible")
                }
                
        }
    }
        getIndicesOfVisibleRows()
        tblExpandable.reloadSections(NSIndexSet(index: indexPath.section) as IndexSet, with: UITableViewRowAnimation.fade)
  }
    
 */
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexOfTappedRow = visibleRowsPerSection[indexPath.section][indexPath.row]
        //  (cellDescriptors[indexPath.section] as! NSMutableArray)[indexOfVisibleRow] as! [String: AnyObject]
        if (cellDescriptors[indexPath.section] as! [[String: AnyObject]])[indexOfTappedRow] ["isExpandable"] as! Bool == true {
            var shouldExpandAndShowSubRows = false
            if (cellDescriptors[indexPath.section] as! [[String: AnyObject]])[indexOfTappedRow]["isExpanded"] as! Bool == false {
                // In this case the cell should expand.
                shouldExpandAndShowSubRows = true
            }
            
            ((cellDescriptors[indexPath.section] as! NSMutableArray)[indexOfTappedRow] as AnyObject).setValue(shouldExpandAndShowSubRows, forKey: "isExpanded")
            
            for i in (indexOfTappedRow + 1)...(indexOfTappedRow + ((cellDescriptors[indexPath.section]  as! [[String: AnyObject]])[indexOfTappedRow]["additionalRows"] as! Int)) {
                ((cellDescriptors[indexPath.section]  as! NSMutableArray)[i] as AnyObject).setValue(shouldExpandAndShowSubRows, forKey: "isVisible")
            }
        }
        else {
            if (cellDescriptors[indexPath.section] as! [[String: AnyObject]])[indexOfTappedRow]["cellIdentifier"] as! String == "idCellValuePicker" {
                var indexOfParentCell: Int!
                /*   for var i = 10; i > 0; i-- {
                 print(i)
                 }
                 
                 // use this
                 for i in (1...10).reverse() {
                 
                 */
                for i in (0...indexOfTappedRow - 1).reversed(){
                    //   for var i=indexOfTappedRow - 1; i>=0; i -= 1 {
                    if (cellDescriptors[indexPath.section] as! [[String: AnyObject]])[i]["isExpandable"] as! Bool == true {
                        indexOfParentCell = i
                        break
                    }
                }
                
                ((cellDescriptors[indexPath.section] as! NSMutableArray)[indexOfParentCell] as AnyObject).setValue((tblExpandable.cellForRow(at: indexPath) as! CustomCell).textLabel?.text, forKey: "primaryTitle")
                ((cellDescriptors[indexPath.section] as! NSMutableArray)[indexOfParentCell] as AnyObject).setValue(false, forKey: "isExpanded")
                
                for i in (indexOfParentCell + 1)...(indexOfParentCell + ((cellDescriptors[indexPath.section]  as! [[String: AnyObject]])[indexOfParentCell]["additionalRows"] as! Int)) {
                    ((cellDescriptors[indexPath.section]   as! NSMutableArray)[i] as AnyObject).setValue(false, forKey: "isVisible")
                }
            }
        }
        
        getIndicesOfVisibleRows()
        tblExpandable.reloadSections(IndexSet(integer: indexPath.section), with: UITableViewRowAnimation.fade)
    }

    
    func getIndicesOfVisibleRows() {
        visibleRowsPerSection.removeAll()
        for currentSectionCells in cellDescriptors {
            var visibleRows = [Int]()
            
            for row in 0...((currentSectionCells as AnyObject).count - 1) {
                if (currentSectionCells as AnyObject).objectAt(row)["isVisible"] as! Bool == true {
                    visibleRows.append(row)
                }
            }
            visibleRowsPerSection.append(visibleRows)
        }
    }
    
    func getCellDescriptorForIndexPath(indexPath: NSIndexPath) -> [String: AnyObject] {
        let indexOfVisibleRow = visibleRowsPerSection[indexPath.section][indexPath.row]
        let cellDescriptor = (cellDescriptors[indexPath.section] as! NSMutableArray)[indexOfVisibleRow] as! [String: AnyObject]
        
        return cellDescriptor
    }
    
    private func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if cellDescriptors != nil {
            return cellDescriptors.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
            case 0: return "Personal"
            case 1: return "Preferences"
            default: return "Work Experience"
        }
    }

                
    func dateWasSelected(_ selectedDateString: String) {
       let dateCellSection = 0
       let dateCellRow = 3
                
     ((cellDescriptors[dateCellSection] as! NSMutableArray)[dateCellRow] as AnyObject).setValue(selectedDateString, forKey: "primaryTitle")
       tblExpandable.reloadData()
    }
                
    func maritalStatusSwitchChangedState(_ isOn: Bool) {
       let maritalSwitchCellSection = 0
       let maritalSwitchCellRow = 6
       let valueToStore = (isOn) ? "true" : "false"
       let valueToDisplay = (isOn) ? "Married" : "Single"
       ((cellDescriptors[maritalSwitchCellSection] as! NSMutableArray)[maritalSwitchCellRow] as AnyObject).setValue(valueToStore, forKey: "value")
       ((cellDescriptors[maritalSwitchCellSection] as! NSMutableArray)[maritalSwitchCellRow - 1] as AnyObject).setValue(valueToDisplay, forKey: "primaryTitle")
       tblExpandable.reloadData()
    }
                
 
     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return headerHeight
     }
     
/*
     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        return headerView
    }
*/

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let currentCellDescriptor = getCellDescriptorForIndexPath(indexPath: indexPath as NSIndexPath)
        
        switch currentCellDescriptor["cellIdentifier"] as! String {
            case "idCellNormal": return 60.0
            case "idCellDatePicker": return 270.0
            default: return 44.0
        }
    }

    func textfieldTextWasChanged(_ newText: String, parentCell: CustomCell) {
       let parentCellIndexPath = tblExpandable.indexPath(for: parentCell)
       let currentFullname = ((cellDescriptors[0] as! NSMutableArray)[0] as AnyObject)["primaryTitle"] as! String
       let fullnameParts = currentFullname.components(separatedBy: " ")
                
       var newFullname = ""
                
       if parentCellIndexPath?.row == 1 {
         if fullnameParts.count == 2 {
            newFullname = "\(newText) \(fullnameParts[1])"
         }
         else {
            newFullname = newText
         }
       } else {
            newFullname = "\(fullnameParts[0])  \(newText)"
         }
                
      ((cellDescriptors[0] as! NSMutableArray)[0] as AnyObject).setValue(newFullname, forKey: "primaryTitle")
      tblExpandable.reloadData()
    }

   func sliderDidChangeValue(_ newSliderValue: String) {
      ((cellDescriptors[2] as! NSMutableArray)[0] as AnyObject).setValue(newSliderValue, forKey: "primaryTitle")
      ((cellDescriptors[2] as! NSMutableArray)[1] as AnyObject).setValue(newSliderValue, forKey: "value")
                
      tblExpandable.reloadSections(IndexSet(integer: 2), with: UITableViewRowAnimation.none)
   }
                
}

