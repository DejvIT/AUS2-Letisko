//
//  FirstViewController.swift
//  PavlickoDavidAUS2-1
//
//  Created by MaestroDavo on 26/10/2019.
//  Copyright © 2019 David Pavlicko. All rights reserved.
//

import UIKit

class FirstSecondViewController: UIViewController {
    
    var airport = Airport.shared
    
    @IBOutlet weak var creatorField: UITextField!
    @IBOutlet weak var codeField: UITextField!
    @IBOutlet weak var lengthField: UITextField!
    @IBOutlet weak var departureTimeField: UITextField!
    @IBOutlet weak var priorityField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onAdd(_ sender: UIButton) {
        
        let airplane = airport.addAirplane(Airplane(creator: creatorField.text!, code: codeField.text!, minLength: Int(lengthField.text!)!, arrivalTime: airport.time, flightPathAssigned: 0, departureTime: Int(departureTimeField.text!)!, priority: Int(priorityField.text!)!))
        
        if (airplane != nil) {
            _ = airport.arrival(airplane!)
        }
        
    }
}
