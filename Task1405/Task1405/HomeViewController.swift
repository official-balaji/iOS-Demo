//
//  HomeViewController.swift
//  Task1405
//
//  Created by Balaji U on 14/05/21.
//  Copyright © 2021 Balaji U. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var firstView: UIView!
    
    @IBOutlet weak var secondView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    

    @IBAction func SwitchTapped(_ sender: Any) {
        if (sender as AnyObject).selectedSegmentIndex == 0{
            firstView.alpha = 0
            secondView.alpha = 1
        }
        else{
            firstView.alpha = 1
            secondView.alpha = 0
        }
    }
    

}


