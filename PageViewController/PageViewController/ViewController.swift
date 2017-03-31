//
//  ViewController.swift
//  PageViewController
//
//  Created by Admin on 27.01.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class ViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    lazy var VCArray: [UIViewController] = {
        return [self.VCInstance(name: "FirstVC"),
                self.VCInstance(name: "SecondVC"),
                self.VCInstance(name: "ThirdVC")]
    }()
    
    private func VCInstance(name: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: name)
    }
    
  var restaurants: [String] = ["cafedeadend.jpg",
    "homei.jpg",
    "teakha.jpg",
    "cafeloisl.jpg",
    "petiteoyster.jpg",
    "forkeerestaurant.jpg",
    "posatelier.jpg",
    "bourkestreetbakery.jpg",
    "haighschocolate.jpg",
    "palominoespresso.jpg",
    "upstate.jpg",
    "traif.jpg",
    "grahamavenuemeats.jpg",
    "wafflewolf.jpg",
    "fiveleaves.jpg",
    "cafelore.jpg",
    "confessional.jpg",
    "barrafina.jpg",
    "donostia.jpg",
    "royaloak.jpg",
    "thaicafe.jpg"
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.dataSource = self
    self.delegate = self
    if let firstVC = VCArray.first {
        setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
    }
  }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        for view in self.view.subviews {
            if view is UIScrollView {
                view.frame = UIScreen.main.bounds
            } else if view is UIPageControl {
                view.backgroundColor = UIColor.clear
            }
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = VCArray.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return VCArray.last
        }
        
        guard VCArray.count > previousIndex else {
            return nil
        }
        return VCArray[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = VCArray.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        
        guard nextIndex < VCArray.count else {
            return VCArray.first
        }
        
        guard VCArray.count > nextIndex else {
            return nil
        }
        return VCArray[nextIndex]
        
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return VCArray.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first, let firstViewControllerIndex = VCArray.index(of: firstViewController) else {
            return 0
        }
        return firstViewControllerIndex
    }
    
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  

}
