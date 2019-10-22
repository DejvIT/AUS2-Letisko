//
//  TableViewController.swift
//  PavlickoDavidAUS2-1
//
//  Created by MaestroDavo on 18/10/2019.
//  Copyright © 2019 David Pavlicko. All rights reserved.
//

import Foundation
import UIKit

class TableViewController: UITableViewController {
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var firstCircle: UIView!
    
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var secondCircle: UIView!
    
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var thirdCircle: UIView!
    
    @IBOutlet weak var fourthView: UIView!
    @IBOutlet weak var fourthCircle: UIView!
    
    @IBOutlet weak var fifthView: UIView!
    @IBOutlet weak var fifthCircle: UIView!
    
    @IBOutlet weak var sixthView: UIView!
    @IBOutlet weak var sixthCircle: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstView.layer.cornerRadius = 25
        firstView.layer.shadowColor = UIColor.white.cgColor
        firstView.layer.shadowRadius = 5
        firstView.layer.shadowOpacity = 0.75
        firstView.layer.shadowOffset = CGSize(width: 0, height: 3)
        
        firstCircle.layer.borderColor = UIColor.black.cgColor
        firstCircle.layer.borderWidth = 2
        firstCircle.layer.cornerRadius = 20
        
        secondView.layer.cornerRadius = 25
        secondView.layer.shadowColor = UIColor.white.cgColor
        secondView.layer.shadowRadius = 5
        secondView.layer.shadowOpacity = 0.75
        secondView.layer.shadowOffset = CGSize(width: 0, height: 3)
        
        secondCircle.layer.borderColor = UIColor.black.cgColor
        secondCircle.layer.borderWidth = 2
        secondCircle.layer.cornerRadius = 20
        
        thirdView.layer.cornerRadius = 25
        thirdView.layer.shadowColor = UIColor.white.cgColor
        thirdView.layer.shadowRadius = 5
        thirdView.layer.shadowOpacity = 0.75
        thirdView.layer.shadowOffset = CGSize(width: 0, height: 3)
        
        thirdCircle.layer.borderColor = UIColor.black.cgColor
        thirdCircle.layer.borderWidth = 2
        thirdCircle.layer.cornerRadius = 20
        
        fourthView.layer.cornerRadius = 25
        fourthView.layer.shadowColor = UIColor.white.cgColor
        fourthView.layer.shadowRadius = 5
        fourthView.layer.shadowOpacity = 0.75
        fourthView.layer.shadowOffset = CGSize(width: 0, height: 3)
        
        fourthCircle.layer.borderColor = UIColor.black.cgColor
        fourthCircle.layer.borderWidth = 2
        fourthCircle.layer.cornerRadius = 20
        
        fifthView.layer.cornerRadius = 25
        fifthView.layer.shadowColor = UIColor.white.cgColor
        fifthView.layer.shadowRadius = 5
        fifthView.layer.shadowOpacity = 0.75
        fifthView.layer.shadowOffset = CGSize(width: 0, height: 3)
        
        fifthCircle.layer.borderColor = UIColor.black.cgColor
        fifthCircle.layer.borderWidth = 2
        fifthCircle.layer.cornerRadius = 20
        
        sixthView.layer.cornerRadius = 25
        sixthView.layer.shadowColor = UIColor.white.cgColor
        sixthView.layer.shadowRadius = 5
        sixthView.layer.shadowOpacity = 0.75
        sixthView.layer.shadowOffset = CGSize(width: 0, height: 3)
        
        sixthCircle.layer.borderColor = UIColor.black.cgColor
        sixthCircle.layer.borderWidth = 2
        sixthCircle.layer.cornerRadius = 20
    }
}
