//
//  FifthViewController.swift
//  PavlickoDavidAUS2-1
//
//  Created by MaestroDavo on 29/10/2019.
//  Copyright © 2019 David Pavlicko. All rights reserved.
//

import UIKit

class FifthViewController: UIViewController, UITextFieldDelegate {

    var airport = Airport.shared
    
    @IBOutlet weak var codeField: UITextField!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
    }

    @IBAction func onStart(_ sender: UIButton) {
        
        if codeField.text != "" {
            let airplane = Airplane(code: codeField.text!)
            let node = airport.airplanes.search(airplane, delete: false, closest: false)
            
            if node?.value._runway != nil {
                let runway = node?.value._runway
                let runwayType = RunwayType(runway!.type)
                let runwayTypeNode = airport.runwayTypes.search(runwayType, delete: false, closest: false)
                node?.value._departureTime = airport.time
                runwayTypeNode?.value.departures.append((node?.value.toString())!)
                
                let nextAirplane = runwayTypeNode?.value.priorityWaiting.getRoot()?.value
                
                runway?._airplane = nil
                node?.value._runway = nil
                _ = airport.airplanesInAir.insert(node!.value)
                _ = airport.airplanes.delete(node!.value)
                
                runwayTypeNode?.value.manageAirplane(nextAirplane!)
                
                descriptionLabel.text = node?.value.toString()
            } else {
                descriptionLabel.text = "Lietadlo nie je pripravené na štart!"
            }
        }
    }
}
