//
//  InsertRunwaysViewController.swift
//  PavlickoDavidAUS2-1
//
//  Created by MaestroDavo on 01/11/2019.
//  Copyright © 2019 David Pavlicko. All rights reserved.
//

import UIKit

class InsertRunwaysViewController: UIViewController, UITextFieldDelegate {

    var airport = Airport.shared
    
    @IBOutlet weak var quantityField: UITextField!
    @IBOutlet weak var lengthField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()

    }

    @IBAction func onAdd(_ sender: UIButton) {
        
        if (quantityField.text != "" && lengthField.text != "") {
            
            let quantity = Int(self.quantityField.text!)!
            let length = Int(self.lengthField.text!)!
            
            let loadingSpinner = Spinner.purpleBackground(onView: self.view)
            DispatchQueue.global(qos: .background).async {

                self.airport.addRunways(quantity: quantity, length: length)
                
                DispatchQueue.main.async {
                    Spinner.removeSpinner(spinner: loadingSpinner)
                }
            }

            quantityField.text = ""
            lengthField.text = ""
        }
    }
    
}
