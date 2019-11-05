//
//  TenthViewController.swift
//  PavlickoDavidAUS2-1
//
//  Created by MaestroDavo on 31/10/2019.
//  Copyright © 2019 David Pavlicko. All rights reserved.
//

import UIKit

class TenthViewController: UIViewController, UITextFieldDelegate {

    var airport = Airport.shared
    
    @IBOutlet weak var codeField: UITextField!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
    }

    @IBAction func onCancel(_ sender: UIButton) {
        
        if (codeField != nil) {
            
            let findAirplane = Airplane(code: codeField.text!)
            let airplane = airport.airplanes.search(findAirplane, delete: false, closest: false)?.value
            
            if (airplane == nil) {
                
                descriptionLabel.text = "Lietadlo s kódom \(findAirplane.code) sa nenašlo."
            } else {

                airplane?.setNonActive()
                _ = airport.waitingForRunway.insert(airplane!)
                
                descriptionLabel.text = airplane?.toString()
                
                codeField.text = ""
            }
            
        }
    }
}
