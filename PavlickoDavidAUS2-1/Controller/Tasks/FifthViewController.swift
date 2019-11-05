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
        
        if (codeField.text != "") {
            let airplane = Airplane(code: codeField.text!)
            let node = airport.airplanes.search(airplane, delete: false, closest: false)
            
            if node?.value._runway != nil {
                let runway = node?.value._runway
                node?.value._departureTime = DateTime(airport.time)
                runway!._departures.append(Departure(node!.value, DateTime(node?.value.arrivalTime), DateTime(node?.value.departureRequest), DateTime(node?.value.departureTime), runway!.id))
                
                runway?._airplane = nil
                node?.value._runway = nil
                
                let nextAirplane = runway?.type!.priorityWaiting.getRoot()?.value
                if nextAirplane != nil {
                    runway?.type!.priorityWaiting.delete()
                    _ = runway?.type!.waitingAirplanes.delete(nextAirplane!)
                    runway?.type!.manageAirplane(nextAirplane!)
                }
                
                _ = airport.airplanesInAir.insert(node!.value)
                _ = airport.airplanes.delete(node!.value)
                
                descriptionLabel.text = node?.value.toString()
                
                codeField.text = ""
                
            } else {
                descriptionLabel.text = "Lietadlo nie je pripravené na štart!"
            }
        }
    }
}
