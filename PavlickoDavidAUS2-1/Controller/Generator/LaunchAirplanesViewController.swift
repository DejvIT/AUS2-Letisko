//
//  LaunchAirplanesViewController.swift
//  PavlickoDavidAUS2-1
//
//  Created by MaestroDavo on 02/11/2019.
//  Copyright © 2019 David Pavlicko. All rights reserved.
//

import UIKit

class LaunchAirplanesViewController: UIViewController, UITextFieldDelegate {

    var airport = Airport.shared
    
    @IBOutlet weak var quantityField: UITextField!
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
    }
    
    @IBAction func onStart(_ sender: UIButton) {
        
        if (quantityField.text != "") {

            var loop = Int(self.quantityField.text!)!
            
            let loadingSpinner = Spinner.purpleBackground(onView: self.view)
            DispatchQueue.global(qos: .background).async {

                let runways = self.airport.allRunways.inOrder()
                
                var checker = 100
                
                while (loop > 0) {
                    loop -= 1
                    
                    if (checker == 0) {
                        break
                    }
                    
                    let randomIndex = Int.random(in: 0...runways.count - 1)
                    let randomRunway = runways[randomIndex]
                    
                    if (randomRunway.airplane != nil) {
                        checker = 100
                        
                        let airplane = randomRunway.airplane
                        
                        airplane!._departureTime = self.airport.time
                        randomRunway._departures.append(Departure(airplane!, DateTime(airplane?.arrivalTime), DateTime(airplane?.departureRequest), DateTime(airplane?.departureTime), randomRunway.id))
                        
                        randomRunway._airplane = nil
                        airplane!._runway = nil
                        
                        let nextAirplane = randomRunway.type!.priorityWaiting.getRoot()?.value
                        if nextAirplane != nil {
                            randomRunway.type!.priorityWaiting.delete()
                            _ = randomRunway.type!.waitingAirplanes.delete(nextAirplane!)
                            randomRunway.type!.manageAirplane(nextAirplane!)
                        }
                        
                        _ = self.airport.airplanesInAir.insert(airplane!)
                        _ = self.airport.airplanes.delete(airplane!)
                        
                    } else {
                        checker -= 1
                    }
                    
                    self.airport.time.addTime()
                }
                
                DispatchQueue.main.async {
                    Spinner.removeSpinner(spinner: loadingSpinner)
                }
            }

            quantityField.text = ""
        }
    }
}
