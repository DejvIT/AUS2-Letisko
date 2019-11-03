//
//  SecondViewController.swift
//  PavlickoDavidAUS2-1
//
//  Created by MaestroDavo on 29/10/2019.
//  Copyright © 2019 David Pavlicko. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    var airport = Airport.shared
    var airplane: Airplane?
    
    @IBOutlet weak var airplaneCode: UILabel!
    @IBOutlet weak var priorityField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        airplane = airport.waitingForRunway.inOrder()[myIndex]
        airplaneCode.text = airplane?.code
    }

    @IBAction func onRequest(_ sender: UIButton) {
        
        if (priorityField.text != "") {
            
            airplane!._priority = Int(priorityField.text!)!
            airplane!._departureRequest = DateTime(airport.time)
            
            let neededRunway = RunwayType(airplane!.minLength)
            let runwayType = airport.runwayTypes.search(neededRunway, delete: false, closest: true)
            runwayType?.value.manageAirplane(airplane!)
            
            if runwayType != nil {
                _ = airport.waitingForRunway.delete(airplane!)
            }
            
            self.dismiss(animated: true, completion: nil)
            self.view.window!.rootViewController?.dismiss(animated: false, completion: nil)
        }
    }
}
