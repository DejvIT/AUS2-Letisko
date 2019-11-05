//
//  InsertAirplanesViewController.swift
//  PavlickoDavidAUS2-1
//
//  Created by MaestroDavo on 01/11/2019.
//  Copyright © 2019 David Pavlicko. All rights reserved.
//

import UIKit

class InsertAirplanesViewController: UIViewController, UITextFieldDelegate {

    var airport = Airport.shared
    
    @IBOutlet weak var quantityField: UITextField!
    @IBOutlet weak var lengthCodeField: UITextField!
    @IBOutlet weak var requestSwitch: UISwitch!
    @IBOutlet weak var requestQuantityField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
    }

    @IBAction func onAdd(_ sender: UIButton) {
        
        if (quantityField.text != "" && lengthCodeField.text != "" && airport.runwayTypes.getCount() > 0) {
            
            var loop = Int(quantityField.text!)!
            var requestLoop = 0
            if (requestSwitch.isOn && requestQuantityField.text != "") {
                requestLoop = Int(requestQuantityField.text!)!
            }
            let length = Int(lengthCodeField.text!)!
            
            let loadingSpinner = Spinner.purpleBackground(onView: self.view)
            DispatchQueue.global(qos: .background).async {

                let longestRunwayType = self.airport.runwayTypes.findMax().value

                var arrayAirplanes : Array<Airplane> = Array()
                
                var checker = 100
                while (loop > 0) {
                    loop -= 1
                    
                    if (checker == 0) {
                        break
                    }
                    
                    let airplane = Airplane(creator: "FRI Airlines", code: self.randomString(length: length), minLength: Int.random(in: 1...longestRunwayType.length), arrivalTime: self.airport.time, departureRequest: nil, departureTime: nil, priority: nil)

                    _ = self.airport.addArrival(airplane)
                    let newAirplane = self.airport.addAirplane(airplane)
                    if (newAirplane != nil) {
                        arrayAirplanes.append(newAirplane!)
                        checker = 100
                    } else {
                        loop += 1
                        checker -= 1
                    }
                    
                    self.airport.time.addTime()
                    
                }
                
                while (requestLoop > 0) {
                    requestLoop -= 1
                    
                    if (arrayAirplanes.count == 0) {
                        break
                    }
                    
                    let randomIndex = Int.random(in: 0...arrayAirplanes.count - 1)
                    let randomAirplane = arrayAirplanes[randomIndex]
                    arrayAirplanes.remove(at: randomIndex)
                    
                    randomAirplane._priority = Int.random(in: 0...self.airport.airplanes.getCount())
                    randomAirplane._departureRequest = self.airport.time
                    
                    let neededRunway = RunwayType(randomAirplane.minLength)
                    let runwayType = self.airport.runwayTypes.search(neededRunway, delete: false, closest: true)
                    runwayType?.value.manageAirplane(randomAirplane)
                    
                    if runwayType != nil {
                        _ = self.airport.waitingForRunway.delete(randomAirplane)
                    }
                    
                    self.airport.time.addTime()
                }
                
                DispatchQueue.main.async {
                    Spinner.removeSpinner(spinner: loadingSpinner)
                }
            }

            quantityField.text = ""
            lengthCodeField.text = ""
            requestQuantityField.text = ""
        }
    }
    
    func randomString(length: Int) -> String {
        
          let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        
          return String((0..<length).map{ _ in letters.randomElement()! })
    }
}
