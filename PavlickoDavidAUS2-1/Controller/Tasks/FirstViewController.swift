//
//  FirstViewController.swift
//  PavlickoDavidAUS2-1
//
//  Created by MaestroDavo on 26/10/2019.
//  Copyright © 2019 David Pavlicko. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate {
    
    var airport = Airport.shared
    
    @IBOutlet weak var creatorField: UITextField!
    @IBOutlet weak var codeField: UITextField!
    @IBOutlet weak var lengthField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
    }

    @IBAction func onAdd(_ sender: UIButton) {
        
        if (creatorField.text! != "" && codeField.text! != "" && lengthField.text! != "") {

            let airplane = Airplane(creator: creatorField.text!, code: codeField.text!, minLength: Int(lengthField.text!)!, arrivalTime: airport.time, departureRequest: nil, departureTime: nil, priority: nil)
            _ = airport.addArrival(airplane)
            _ = airport.addAirplane(airplane)
            
            self.creatorField.text = ""
            self.codeField.text = ""
            self.lengthField.text = ""
        }
        
    }
}
