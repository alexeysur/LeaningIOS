//
//  ViewController.swift
//  ScrollView
//
//  Created by Admin on 08.02.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var featureScrollView: UIScrollView!
    @IBOutlet weak var featurePageControl: UIPageControl!
    var featureArray = [Dictionary<String,String>]()
    
    let feature1 = ["title":"Cake1", "price":"$2.55","image":"zakaznoyP202yarusn1"]
    let feature2 = ["title":"Cake2", "price":"$4.55","image":"zakaznoyP202yarusn2"]
    let feature3 = ["title":"Cake3", "price":"$12.55","image":"zakaznoyP202yarusn3"]
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        featureArray = [feature1, feature2, feature3]
        featureScrollView.isPagingEnabled = true
        featureScrollView.contentSize = CGSize(width: self.view.bounds.width * CGFloat(featureArray.count), height: 250)
        featureScrollView.showsHorizontalScrollIndicator = false
        
        featureScrollView.delegate = self
        
        loadFeatures()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loadFeatures() {
        for (index, feature) in featureArray.enumerated() {
            if let featurescrollView = Bundle.main.loadNibNamed("ScrollView", owner: self, options: nil)?.first as? FeatureScrollView {
                featurescrollView.featureImageView.image = UIImage(named: feature["image"]!)
                featurescrollView.titleLabel.text = feature["title"]
                featurescrollView.priceLabel.text = feature["price"]
                
                featurescrollView.purchaseButton.tag = index
                featurescrollView.purchaseButton.addTarget(self, action: #selector(ViewController.buyFeature(sender:)), for: .touchUpInside)
                
                featureScrollView.addSubview(featurescrollView)
                featurescrollView.frame.size.width = self.view.bounds.size.width
                featurescrollView.frame.origin.x = CGFloat(index) * self.view.bounds.size.width
            }
        }
    }

    
    func buyFeature(sender: UIButton) {
        print("The user wants to buy feature \(sender.tag)")
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / scrollView.frame.size.width
        featurePageControl.currentPage = Int(page)
    }
    
    
}

