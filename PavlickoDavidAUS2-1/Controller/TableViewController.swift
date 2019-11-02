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
    
    var airport = Airport.shared
    
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
    
    @IBOutlet weak var seventhView: UIView!
    @IBOutlet weak var seventhCircle: UIView!
    
    @IBOutlet weak var eightView: UIView!
    @IBOutlet weak var eightCircle: UIView!
    
    @IBOutlet weak var ninethView: UIView!
    @IBOutlet weak var ninethCircle: UIView!
    
    @IBOutlet weak var tenthView: UIView!
    @IBOutlet weak var tenthCircle: UIView!
    
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
        
        seventhView.layer.cornerRadius = 25
        seventhView.layer.shadowColor = UIColor.white.cgColor
        seventhView.layer.shadowRadius = 5
        seventhView.layer.shadowOpacity = 0.75
        seventhView.layer.shadowOffset = CGSize(width: 0, height: 3)
        
        seventhCircle.layer.borderColor = UIColor.black.cgColor
        seventhCircle.layer.borderWidth = 2
        seventhCircle.layer.cornerRadius = 20
        
        eightView.layer.cornerRadius = 25
        eightView.layer.shadowColor = UIColor.white.cgColor
        eightView.layer.shadowRadius = 5
        eightView.layer.shadowOpacity = 0.75
        eightView.layer.shadowOffset = CGSize(width: 0, height: 3)
        
        eightCircle.layer.borderColor = UIColor.black.cgColor
        eightCircle.layer.borderWidth = 2
        eightCircle.layer.cornerRadius = 20
        
        ninethView.layer.cornerRadius = 25
        ninethView.layer.shadowColor = UIColor.white.cgColor
        ninethView.layer.shadowRadius = 5
        ninethView.layer.shadowOpacity = 0.75
        ninethView.layer.shadowOffset = CGSize(width: 0, height: 3)
        
        ninethCircle.layer.borderColor = UIColor.black.cgColor
        ninethCircle.layer.borderWidth = 2
        ninethCircle.layer.cornerRadius = 20
        
        tenthView.layer.cornerRadius = 25
        tenthView.layer.shadowColor = UIColor.white.cgColor
        tenthView.layer.shadowRadius = 5
        tenthView.layer.shadowOpacity = 0.75
        tenthView.layer.shadowOffset = CGSize(width: 0, height: 3)
        
        tenthCircle.layer.borderColor = UIColor.black.cgColor
        tenthCircle.layer.borderWidth = 2
        tenthCircle.layer.cornerRadius = 20
        
        timeButton.setTitle(airport.time.dateToString(), for: .normal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        timeButton.setTitle(airport.time.dateToString(), for: .normal)
    }
    
    @IBOutlet weak var timeButton: UIButton!
    @IBAction func onTime(_ sender: UIButton) {
        airport._time.addTime()
        timeButton.setTitle(airport.time.dateToString(), for: .normal)
    }
    
}
