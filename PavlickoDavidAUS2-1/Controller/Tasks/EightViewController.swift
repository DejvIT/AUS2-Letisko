//
//  EightViewController.swift
//  PavlickoDavidAUS2-1
//
//  Created by MaestroDavo on 31/10/2019.
//  Copyright © 2019 David Pavlicko. All rights reserved.
//

import UIKit

class EightViewController: UIViewController, UITextFieldDelegate {

    let airport = Airport.shared
    
    @IBOutlet weak var codeField: UITextField!
    @IBOutlet weak var priorityField: UITextField!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var changeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
    }

    @IBAction func onChange(_ sender: UIButton) {
        
        if (priorityField.text != "" && codeField.text != "") {
            
            let findingAirplane = Airplane(code: codeField.text!)
            let airplane = airport.airplanes.search(findingAirplane, delete: false, closest: false)?.value
            
            if (airplane == nil) {
                self.descriptionLabel.text = "Lietadlo s kódom \(self.codeField.text ?? "-") sa nenachádza na letisku."
            } else {
                
                if (airplane?.pairingHeapNode == nil) {
                    self.descriptionLabel.text = "Lietadlo nečaká v párovacej halde."
                } else {

                    let priority = priorityField.text
                    if ((airplane?.priority)! < Int(priority!)!) {
                        
                        airplane?._priority = Int(priority!)!
                        airplane?.runwayType?.priorityWaiting.decrease((airplane?.pairingHeapNode)!)
                        
                    } else {
                        airplane?._priority = Int(priority!)!
                        airplane?.runwayType?.priorityWaiting.increase((airplane?.pairingHeapNode)!)
                    }
                }
            }
        }
    }
}
